import           System.FilePath (splitExtension)

import           Hakyll
import           Text.Pandoc

main :: IO ()
main = hakyll $ do

    match "img/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "src/**.md" $ do
        route $ setExtension "html"
        compile $ pandocCompilerWith defaultHakyllReaderOptions withTOC
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
