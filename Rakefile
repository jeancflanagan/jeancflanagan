require 'stringex'
require 's3_website'
require 'envyable'

Envyable.load('./_config/env.yml')

## Website deploying config ##

local_images   = "_static" # typically called "_images"
local_site     = "_site" # typically called "_site"

## "rake post" to generate a new post with front matter
### borrowed most of the code from Octopress https://github.com/imathis/octopress/blob/master/Rakefile
task :post do
  title = get_stdin("Enter a title for your post: ")
  if title == ""
    title = "New Post"
  end
  filename = "_posts/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.md"
  photo = get_stdin("Making a photo post? y or n? ")
  if photo == "y"
    open(filename, 'w') do |post|
      post.puts "---"
      post.puts "layout: photoset"
      post.puts "category: photo"
      post.puts "title: \'#{title.gsub(/&/,'&amp;')}\'"
      post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
      post.puts "location: \'\'"
      post.puts "image: "
      post.puts "period: \'\'"
      post.puts "image:"
      post.puts "  - url: "
      post.puts "    caption: \'\'"
      post.puts "    alt: \'\'"
      post.puts "    coordinates: \'\'"
      post.puts ""
      post.puts "---"
      post.puts ""
    end
  else
    open(filename, 'w') do |post|
      post.puts "---"
      post.puts "layout: writing"
      post.puts "category: writing"
      post.puts "title: \'#{title.gsub(/&/,'&amp;')}\'"
      post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
      post.puts "excerpt: \'\'"
      post.puts "source: "
      post.puts "sourceurl: "
      post.puts "image:"
      post.puts "  - url: "
      post.puts "    caption: \'\'"
      post.puts "    alt: \'\'"
      post.puts ""
      post.puts "---"
      post.puts ""
    end
  end
  puts "Created new post: #{filename}"
end

## "$ rake serve"
desc "serve Jekyll _site serve locally"
task :serve do
  system "bundle exec jekyll serve --config _config/prod.yml,_config/dev.yml"
end

## "$ rake deploy"
desc "deploy Jekyll _site to development S3 via s3_website"
task :dev do
  system "JEKYLL_ENV=production bundle exec jekyll build --config _config/prod.yml,_config/dev.yml"
  system "s3_website push --config-dir _config"
  puts "## Deployed site to S3 development ##"
end

## "$ rake deploy"
desc "deploy Jekyll _site to production S3 via s3_website"
task :prod do
  system "JEKYLL_ENV=production bundle exec jekyll build --config _config/prod.yml"
  system "DEPLOY=production s3_website push --config-dir _config"
  puts "## Deployed site to S3 production ##"
end


def get_stdin(message)
  print message
  STDIN.gets.chomp
end
