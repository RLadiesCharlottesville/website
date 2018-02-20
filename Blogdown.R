

##### Why use blogdown? ####

# 1.) It produces a static website by only using static files like HTML, CSS, 
#       and JavaScript. It can be hosted on any server, and it doesn't require
#       server-side scripts like PHP or databaes like WordPress does. 
# 2.) It is generated using R Markdown so it is very portable (PDF conversion)
#       and reproducible (graphics, tables, rendered dynamically)
# 3.) Used for general purpose websites, not just blogs (inherits from bookdown)



#### Getting Started ####

install.packages("blogdown")
library(blogdown)
blogdown::install_hugo()
# LiveReload automatically rebuilds and reloads the site in your web browser

# Three basic components of a Hugo-based website:

# 1.) config.toml is the configuration file that allows you to specify 
#       global settings, EX:
#   baseurl = "/"
#   languageCode = "en-us"
#   title = "A Hugo website"
#   theme = "hugo-lithium-theme"
#   [[menu.main]]
#   name = "About"
#   url = "/about/"
#   [[menu.main]]
#   name = "GitHub"
#   url = "https://github.com/rstudio/blogdown"
#   [[menu.main]]
#   name = "Twitter"
#   url = "https://twitter.com/rstudio"

# 2.) content/ directory is where you write the RMD source files (EX. about me,
#       /posts). There are also some arbitrary files depending on the structure
#       of your website. 

# 3.) public/ directory (publishing) is the directory where your website is
#       generated, so you won't need to add any files here. 



# RStudio Addins:

blogdown::serve_site() #continually serves website locally using LiveReload so 
# you can edit while live previewing 

blogdown::new_post() #provides dialog box to enter metadata of new blog post
# You can use this addin to create normal pages under any directories under
# content/. EX. to add a resume page, change the filename to "resume.md" from
# the default post/YYYY-mm-dd-resume.md. You can select the date from a 
# calendar widget provided by Shiny. It will scan categories and tags. After a
# new post is created it will automatically open. 

"Update YAML Metadata" #update metadata (author, date, etc.) of current post
# using dropdown menu



#### Global settings ####
file.edit("~/.Rprofile") #set author as Samatha Toet in .Rprofile script:
# options(servr.daemon = TRUE, blogdown.author = "Samantha Toet")


#### RMarkdown ####

# An RMD doc is usually made up of YAML metadata and the document body. YAML 
#       metadata is written bw a pair of --- to set some attributes of the doc
#       (title, author, date). The document body is made up of code chunks and
#       narratives. A code chunk starts with '''{r} and ends with '''. Converted
#       into html by knitting.

# RMarkdown vs. Markdown:
# 1.) You cannot execute code in plain Markdown - you can put it there, but the
#       code will not run, it will only be used for demo purposes. 
# 2.) An R Markdown document is compiled through the packages rmarkdown, 
#       bookdown, and Pandoc, which means you can use most features of Pandoc’s 
#       Markdown and bookdown’s Markdown extensions in blogdown.
# 3.) Basic text formatting:
#   - Inline text:
        # _italic_ 
        # **bold**
        # 'inline code'
#   - Inline elements:
        # H~2~0 #subscript
        # R^2^ #superscript
        # [text](URL) #links
        # ![title](URL) #images
        # text^[footnote] #footnotes
#   - Block-level elements: paragraphs, numbered and unnumbered section headers, 
#       ordered and unordered lists, block quotes, tables, horizontal rules
#   - Math expressions and equations (inc. theorems and proofs)
#   - Citations and bibliography
#   - HTML widgets and Shiny apps using <iframe>



#### Hugo ####

# For a static site, each URL you visit often has a corresponding HTML file 
#       stored on the server, so there is no need to compute anything before 
#       serving the file to visitors. This means static sites tend to be faster 
#       in response time than dynamic sites, and they are also much easier to 
#       deploy, since deployment simply means copying static files to a server.

# Themes control the appearance and functionality of your site. 
# Browse themes at: http://themes.gohugo.io

blogdown::install_theme("halogenica/beautifulhugo") #this will create a new 
# theme directory with the Hugo information

# Hugo uses a special file and folder structure to create your website:
# 1.) config.toml
#   a.) located in root
#   b.) global configurations of your site like title, author, links, etc.
#   c.) TOML is made up of key=value pairs separated by =
#       i.) to edit a configuration, change the value, EX:
#               title = "My Awesome Site" 
#               relativeURLs = true (note that bools are lower and written)
#       ii.) values in [] are tables, EX:
#           [social]
#               github = "https://www.github.com/RLadiesCharlottesville"
#               twitter = "https://twitter.com/RLadiesCville" 
#               Note: the above table will populate the .Site.Social variable 
#               in your site’s templates 
#       iii.) values in [[]] are arrays of tables, or a menu, EX:
#           [[menu.main]]
#               name = "Blog"
#               url = "/blog/"
#           [[menu.main]]
#               name = "Categories"
#               url = "/categories/"
#           [[menu.main]]
#               name = "About"
#               url = "/about/"
#   c.) Options
#       i.) baseURL: change to the url of your website 
#       ii.) enableEmoji: set to true to enable emoticons 
#       iii.) permaLinks: rules to generate permanent links on your pages, EX.
#           [permalinks]
#               post = "/:year/:month/:day/:slug/" #use slug to change the title
#                   of your post without having to change the link
#       iv.) publishDir: directory under which you want to generate the website
#       v.) theme: directory name of the Hugo theme under themes/
#       vi.) ignoreFiles: list of filename patterns (regular expressions) for 
#           Hugo to ignore certain files when building the site. Specify  at 
#           least these patterns:
#           ["\\.Rmd$", "\\.Rmarkdown$", "_files$", "_cache$"]
#       vii.) uglyURLs: by default, Hugo generates “clean” URLs
content/
#   - static/
#   - themes/
#   - layouts/






#### Recommended Workflow ####

# To start a new website:

# 1.) Pick a Hugo theme and copy the link to the Github repo. 
# 2.) Create a new project in RStudio and type the code
blogdown::new_site(theme = 'user/repo')
# 3.) Play with the new site for a while and if you do not like it, you can 
#       repeat the above steps, otherwise edit the options in config.toml

# To edit a website:
# 1.) Click the RStudio addin "Serve Site" to preview in the RViewer. This only
#       needs to be done once every time you upen the RStudio project. DO NOT
#       click the "knit" button on the RStudio toolbar. 
# 2.) Use the "New Post" addin to create a new post or page, then start writing
#       your content. 
# 3.) Use the "Update Metadata" addin to to modify the YAML data, if needed. 

# To publish a website:
# 1.) Restart the R session and run blogdown::hugo_build(). You should get a 
#       public/ directory under the root directory of your project. 
# 2.) Log onto to www.netlify.com with your Github account. drag and drop the 
#       public/ folder from your file viewer to the indicated area on the 
#       Netlify web page, where it says “Drag a folder with a static site here.”
# 3.) After a few seconds, Netlify will deploy the files and will assign a 
#       random subdomain random-word-12345.netlify.com to you. Go ahead and 
#       edit this to reflect something more meaningful.













