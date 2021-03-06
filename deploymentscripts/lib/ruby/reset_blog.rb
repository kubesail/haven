## This script deletes all users and all uploaded content.
## Usage: from the application directory (often /var/www/haven/):
##  bin/rails r reset_blog.rb yes
param = ARGV[0]
confirm = false
if "yes" == param
  confirm = true
  puts "Deleting everything, you have 5 seconds to crtl-c if this isn't want you want"
  sleep 5
else
  puts "Running in dry mode, pass parameter \"yes\" to actually delete everything"
end

Image.find_each do |i|
  STDERR.puts "Deleting image: #{i.to_s}"
  i.destroy if confirm
end

User.find_each do |u|
  STDERR.puts "Deleting user:"
  puts u.email
  u.destroy if confirm
end

