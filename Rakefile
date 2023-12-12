# frozen_string_literal: true

# https://github.com/phstc/dotfiles/blob/master/Rakefile

require 'rake'
require 'colorize'

task default: [:install]

files = {
  ".vimrc" => "~/.vimrc",
  ".tmux.conf" => "~/.tmux.conf",
  ".gitconfig" => "~/.gitconfig",
  ".gitignore" => "~/.gitignore",
  ".tmuxp" => "~/.tmuxp",
  ".tool-versions" => "~/.tool-versions",
}

desc "install the dot files into user's home directory"
task :install do
  files.each do |src, dest|
    print "compare #{src.ljust(18)} #{dest.ljust(18)} "
    dest = File.expand_path(dest)
    if File.exist?(dest)
      src_file = File.new(src)
      dest_file = File.new(dest)
      if File.identical? src_file, dest_file
        puts "identical!".green
      else
        puts "existing file differs!".red
        # system %(diff -u "#{src}" "#{dest}")
        print "overwrite #{dest.red}? [ynq] "
        case $stdin.gets.chomp
        when 'y'
          puts "TODO!"
          # TODO: replace_file(file)
        when 'q'
          exit
        else
          puts "skipping #{dest}"
        end
      end
    else
      link_file(src, dest)
    end
  end
end

def link_file(src, dest)
  puts "linking #{dest} -> #{src}".yellow
  system %(ln -s "$PWD/#{src}" "#{dest}")
end

desc 'init and update the git submodules'
task :modules do
  update_git_submodules
end

def update_git_submodules
  puts 'updating git-submodules'
  system 'git submodule init'
  system 'git submodule update'
  system 'git submodule -q foreach git pull -q origin master'
end
