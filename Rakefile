require 'stringex'

## Rsync config ##

# Assumes that ssh is already set up on the server.
# Assumes that S3 local environmental variables are set up.
# Assumes that ImageOptim and ImageOptim-CLI are installed

ssh_user       = "jcflanagan@jeancflanagan.com"
local_images   = "_images" # typically called "_images"
local_site     = "_site" # typically called "_site"
remote_images  = "webapps/static"
remote_site    = "webapps/dev"

rsync_delete   = true
include_images = "--include='*.png' --include='*.jpg' --include='*/' --exclude='*'"

## "rake new_writing" to generate a new post with "Writing" front matter
### borrowed most of the code from Octopress https://github.com/imathis/octopress/blob/master/Rakefile

task :new_post do
  title = get_stdin("Enter a title for your post: ")
  if title == ""
    title = "New Post"
  end
  filename = "_posts/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.md"
  puts "Creating new post: #{filename}"
  photo = get_stdin("Making a photo post? y or n? ")
  if photo == "y"
    open(filename, 'w') do |post|
      post.puts "---"
      post.puts "layout: photoset"
      post.puts "category: photo"
      post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
      post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
      post.puts "location: \'\'"
      post.puts "excert_image: "
      post.puts "excerpt: \'\'"
      post.puts "source: "
      post.puts "image:"
      post.puts "  - "
      post.puts "image_alt:"
      post.puts "  -  \'\'"
      post.puts "image_caption:"
      post.puts "  -  \'\'"
      post.puts "---"
    end
  else
    open(filename, 'w') do |post|
      post.puts "---"
      post.puts "layout: writing"
      post.puts "category: writing"
      post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
      post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
      post.puts "excerpt: \'\'"
      post.puts "source: "
      post.puts "image:"
      post.puts "  - "
      post.puts "image_alt:"
      post.puts "  -  \'\'"
      post.puts "image_caption:"
      post.puts "  -  \'\'"
      post.puts "---"
    end
  end
end

## "rake optimize" to optimize a folder of images in ImageOptim-CLI
desc "run a folder of images through ImageOptim-CLI"
task :optimize do
  system "imageoptim -d #{local_images}/"
  puts "## Images optimized ##"
end

## "rake load" to load images in the local image directory to your server
desc "deploy Jekyll images to remote server via rsync"
task :load do
  system "s3_website push --site #{local_images}"
  puts "## Deployed images to S3 ##"
end

## "rake deploy" to deploy _site and _images to your server
desc "deploy Jekyll _site and _images to remote server via rsync"
task :deploy => :load do
  system "rsync -avze ssh #{"--delete" unless rsync_delete == false} #{local_site}/ #{ssh_user}:#{remote_site}/"
  puts "## Deployed site via rsync ##"
end


def get_stdin(message)
  print message
  STDIN.gets.chomp
end