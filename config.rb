# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

data.schools.schools.each do |school|
    slug = school[0]
    name = school[1]
    story = school[2]
  
    proxy "/#{slug}/index.html", "/templates/school.html", :locals => { :slug => slug, :name => name, :story => story }, :ignore => true

    proxy "/#{slug}/pledge/index.html", "/templates/pledge.html", :locals => { :slug => slug, :name => name }, :ignore => true

    proxy "/#{slug}/thanks/index.html", "/templates/thanks.html", :locals => { :slug => slug, :name => name }, :ignore => true
end


# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  deploy.branch   = 'build'
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end

activate :livereload, js_host: '10.0.0.2'

activate :relative_assets
set :relative_links, true

set :font_path, 'fonts/'

activate :directory_indexes
