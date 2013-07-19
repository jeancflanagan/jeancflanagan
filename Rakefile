## Rsync config ##

# Assumes that ssh is already set up on the server.
# Assumes that ImageOptim and ImageOptim-CLI are installed

ssh_user       = "opattison@oliverpattison.org"
local_images   = "_images" # typically called "_images"
local_site     = "_site" # typically called "_site"
remote_images  = "webapps/static"
remote_site    = "webapps/development"

rsync_delete   = true
include_images = "--include='*.png' --include='*.jpg' --include='*/' --exclude='*'"

## "rake optimize" to optimize a folder of images in ImageOptim-CLI
desc "run a folder of images through ImageOptim-CLI"
task :optimize do
  system "imageoptim -d #{local_images}/"
  puts "## Images optimized ##"
end

## "rake load" to load images in the local image directory to your server
desc "deploy Jekyll images to remote server via rsync"
task :load do
  system "rsync -avze ssh #{include_images} #{local_images}/ #{ssh_user}:#{remote_images}/"
  puts "## Deploying images via rsync ##"
end

## "rake deploy" to deploy _site and _images to your server
desc "deploy Jekyll _site and _images to remote server via rsync"
+task :deploy => :load do
  system "rsync -avze ssh #{"--delete" unless rsync_delete == false} #{local_site}/ #{ssh_user}:#{remote_site}/"
  puts "## Deploying _site via rsync ##"
end