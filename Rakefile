require 'stringex'

## Rsync config ##

# Assumes that ssh is already set up on the server.
# Assumes that S3_website gem is configured.
# Assumes that ImageOptim and ImageOptim-CLI are installed.

ssh_user       = "jcflanagan@jeancflanagan.com"
s3_for_images  = true

local_images   = "_images" # typically called "_images"
local_site     = "_site" # typically called "_site"
remote_images  = "webapps/static"
remote_site    = "webapps/dev"

include_images = "--include='*.png' --include='*.jpg' --include='*/' --exclude='*'"

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
      post.puts "excert_image: "
      post.puts "excerpt: \'\'"
      post.puts "image:"
      post.puts "  - "
      post.puts "image_alt:"
      post.puts "  - \'\'"
      post.puts "image_caption:"
      post.puts "  - \'\'"
      post.puts "---"
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
      post.puts "  - "
      post.puts "image_alt:"
      post.puts "  - \'\'"
      post.puts "image_caption:"
      post.puts "  - \'\'"
      post.puts "---"
    end
  end
  puts "Created new post: #{filename}"
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
  if s3_for_images
    system "s3_website push --site #{local_images}"
    puts "## Deployed images to S3 ##"
  else
    system "rsync -avze ssh #{include_images} #{local_images}/ #{ssh_user}:#{remote_images}/"
    puts "## Deploying images via rsync ##"
  end
end

## "rake deploy" to deploy _site and _images to your server
desc "deploy Jekyll _site and _images to remote server via rsync"
task :deploy => :load do
  system "rsync -avze ssh --delete #{local_site}/ #{ssh_user}:#{remote_site}/"
  puts "## Deployed site via rsync ##"
end


def get_stdin(message)
  print message
  STDIN.gets.chomp
end