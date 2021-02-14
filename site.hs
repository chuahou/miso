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

    match "**.md" $ do
        route $ setExtension "html"
        compile $ pandocCompilerWithTransformM
                    defaultHakyllReaderOptions
                    withTOC
                    (walkM tikzFilter)
            >>= loadAndApplyTemplate "tmpl/default.html" defaultContext
            >>= relativizeUrls
            >>= urlMd2Html

    match "tmpl/*" $ compile templateBodyCompiler

-- | Converts @*.md@ urls to @*.html@.
urlMd2Html :: Item String -> Compiler (Item String)
urlMd2Html = return . fmap (withUrls go)
    where
        go url = case splitExtension url of
                   (name, ".md") -> name ++ ".html"
                   _             -> url

-- | Writer options with TOC.
withTOC :: WriterOptions
withTOC = defaultHakyllWriterOptions
    { writerNumberSections  = True
    , writerTableOfContents = True
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

-- | Compiles @```tikz@ environments with @rubber@ and @pdftocairo@.
-- Based on <https://taeer.bar-yam.me/blog/posts/hakyll-tikz/>.
tikzFilter :: Block -> Compiler Block
tikzFilter (CodeBlock attr@(_, "tikz":_, _) contents) =
    fmap (imageBlock . addHeader . URI.encode . filter (/= '\n') . itemBody) $

        -- Create item with contents to be compiled
        makeItem (Text.unpack contents)

        -- Apply tikz template
        >>= loadAndApplyTemplate (fromFilePath "tmpl/tikz.tex")
                                 (bodyField "body")

        -- Compile LaTeX and convert to SVG
        >>= withItemBody (return . C8.pack
                            >=> unixFilterLBS "rubber-pipe" ["--module", "xelatex", "--pdf"]
                            >=> unixFilterLBS "pdftocairo"  ["-svg", "-", "-"]
                            >=> return . C8.unpack)
    where
        -- | Creates an image block pointing to the generated image.
        imageBlock fname = Para [Image attr [] (Text.pack fname, "")]

        -- | Adds data URI header.
        addHeader = ("data:image/svg+xml;utf8," ++)

-- Do nothing for all other blocks.
tikzFilter x = return x
