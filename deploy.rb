#!/usr/bin/env ruby

files = %w(bashrc gemrc gitattributes gitconfig gitignore gvimrc railsrc rspec screenrc vimrc zshenv zshrc)
dirs = %w(vim)

home = File.expand_path('~')
base = File.expand_path(File.dirname(__FILE__))
puts base
files.each do |file|
  src = "#{base}/#{file}"
  dest = "#{home}/.#{file}"
  if File.exists?(dest) || File.symlink?(dest)
    File.delete(dest)
    puts "deleted #{dest}"
  end
  File.symlink("#{src}", "#{dest}")
  puts "created #{dest} -> #{src}"
end
dirs.each do |dir|
  src = "#{base}/#{dir}"
  dest = "#{home}/.#{dir}"
  if File.exists?(dest) || File.symlink?(dest)
    File.delete(dest)
    puts "deleted #{dest}"
  end
  File.symlink("#{src}", "#{dest}")
  puts "created #{dest} -> #{src}"
end
