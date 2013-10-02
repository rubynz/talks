require './lib/talk'

set :project_name, "NZ Ruby Talks"

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, autolink: true

activate :syntax

activate :blog do |blog|
  blog.permalink = ":year/:title.html"
  blog.sources = "talks/:year/:month-:day-:title.html"
  blog.publish_future_dated = true
end

# Use directory indexes, for pretty URLs
activate :directory_indexes

helpers do

  def page_title(separator: " – ")
    [current_page.data.title, project_name].compact.join(separator)
  end

  def talks
    Talk.all(sitemap.resources)
  end

  def current_talk
    Talk.new(current_page)
  end

end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end
