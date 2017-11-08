#!/usr/bin/env ruby

def deletable?(dest, src)
  if File.symlink?(dest)
    File.expand_path(File.readlink(dest)) != src
  else
    File.exists?(dest)
  end
end

files = %w(bashrc ctags gemrc gvimrc pryrc railsrc rspec screenrc tigrc tmux.conf vimrc zshenv zshrc)
dirs = %w(vim)
config_dirs = %w(git peco nvim)

home = File.expand_path('~')
base = File.expand_path(File.dirname(__FILE__))

files.each do |file|
  src = "#{base}/#{file}"
  dest = "#{home}/.#{file}"
  if deletable?(dest, src)
    File.delete(dest)
    puts "deleted #{dest}"
  end
  if File.exists?(dest)
    puts "#{dest} is valid"
  else
    File.symlink("#{src}", "#{dest}")
    puts "created #{dest} -> #{src}"
  end
end

dirs.each do |dir|
  src = "#{base}/#{dir}"
  dest = "#{home}/.#{dir}"
  if deletable?(dest, src)
    File.delete(dest)
    puts "deleted #{dest}"
  end
  if File.exists?(dest)
    puts "#{dest} is valid"
  else
    File.symlink("#{src}", "#{dest}")
    puts "created #{dest} -> #{src}"
  end
end

config_dirs.each do |dir|
  src = "#{base}/#{dir}"
  dest = "#{home}/.config/#{dir}"
  if deletable?(dest, src)
    File.delete(dest)
    puts "deleted #{dest}"
  end
  if File.exists?(dest)
    puts "#{dest} is valid"
  else
    File.symlink("#{src}", "#{dest}")
    puts "created #{dest} -> #{src}"
  end
end
