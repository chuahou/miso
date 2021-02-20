import           Hakyll
import           Text.Pandoc

import           Control.Monad              ((>=>))
import qualified Data.ByteString.Lazy.Char8 as C8 (pack, unpack)
import qualified Data.Text                  as Text (pack, unpack)
import qualified Network.URI.Encode         as URI (encode)
import           System.FilePath            (splitExtension)
import           Text.Pandoc.Walk           (walkM)

main :: IO ()
main = hakyllWith (defaultConfiguration { destinationDirectory = "docs" }) $ do

    match "img/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "src/**.md" $ do
        route $ setExtension "html" `composeRoutes` removeLeadingDirectory
        compile $ pandocCompilerWithTransformM
                    defaultHakyllReaderOptions
                    (withTOC . withMath $ defaultHakyllWriterOptions)
                    (walkM texFilter)
            >>= loadAndApplyTemplate "tmpl/default.html" defaultContext
            >>= relativizeUrls
            >>= urlMd2Html

    match "deps/katex/dist/**" $ do
        route $ customRoute $ ("katex/" <>) .
            (!! 3) . iterate (tail . dropWhile (/= '/')) . toFilePath
        compile copyFileCompiler

    match "deps/latex-css/style.css" $ do
        route $ constRoute "css/latex.css"
        compile compressCssCompiler

    match "deps/latex-css/fonts/*" $ do
        route $ customRoute $ ("css/fonts/" <>) .
            (!! 3) . iterate (tail . dropWhile (/= '/')) . toFilePath
        compile copyFileCompiler

    match "tmpl/*" $ compile templateBodyCompiler

-- | Removes leading directory in route.
removeLeadingDirectory :: Routes
removeLeadingDirectory = customRoute $ tail . dropWhile (/= '/') . toFilePath

-- | Converts @*.md@ urls to @*.html@.
urlMd2Html :: Item String -> Compiler (Item String)
urlMd2Html = return . fmap (withUrls go)
    where
        go url = case splitExtension url of
                   (name, ".md") -> name ++ ".html"
                   _             -> url

-- | Adds writer options with TOC.
withTOC :: WriterOptions -> WriterOptions
withTOC x = x
    { writerTableOfContents = True
    , writerTOCDepth        = 2
    , writerTemplate        = Just tocTemplate
    }
    where
        tocTemplate =
            either error id $ either (error . show) id $
            runPure $ runWithDefaultPartials $
            compileTemplate "" "\
\<div id=\"toc\">\n\
\$toc$\n\
\</div>\n\
\$body$"

-- | Adds writer options for maths.
withMath :: WriterOptions -> WriterOptions
withMath x = x
    { writerExtensions = foldr enableExtension (writerExtensions x)
        [ Ext_tex_math_dollars
        , Ext_tex_math_double_backslash
        , Ext_latex_macros
        ]
    , writerHTMLMathMethod = MathJax ""
    }

-- | Compiles @```tex@ environments with @rubber@ and @pdftocairo@.
-- Based on <https://taeer.bar-yam.me/blog/posts/hakyll-tikz/>.
-- Applies @tmpl/[tmpl].tex@ template, or none if @tmpl@ is @none@.
texFilter :: Block -> Compiler Block
texFilter (CodeBlock attr@(_, "tex":tmpl:_, _) contents) = case tmpl of

    "none" -> -- no template
        go pure

    _ -> -- some template
        go $ loadAndApplyTemplate
                (fromFilePath $ "tmpl/" <> Text.unpack tmpl <> ".tex")
                (bodyField "body")

    where
        -- | Runs compiler, with template given by 't'.
        go t =
            fmap (imageBlock . addHeader . URI.encode . filter (/= '\n') . itemBody) $

                -- Create item with contents to be compiled
                makeItem (Text.unpack contents)

                -- Apply template
                >>= t

                -- Compile LaTeX and convert to SVG
                >>= withItemBody (return . C8.pack
                                    >=> unixFilterLBS "rubber-pipe" ["--module", "xelatex", "--pdf"]
                                    >=> unixFilterLBS "pdftocairo"  ["-svg", "-", "-"]
                                    >=> return . C8.unpack)

        -- | Creates an image block pointing to the generated image.
        imageBlock fname = Para [Image attr [] (Text.pack fname, "")]

        -- | Adds data URI header.
        addHeader = ("data:image/svg+xml;utf8," ++)

-- A singular @tex@ class is treated as @{.tex .default}@.
texFilter (CodeBlock (ident, ["tex"], kvs) contents) =
    texFilter (CodeBlock (ident, ["tex", "default"], kvs) contents)

-- Do nothing for all other blocks.
texFilter x = return x
