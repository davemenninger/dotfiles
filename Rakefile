# frozen_string_literal: true

# https://github.com/phstc/dotfiles/blob/master/Rakefile

require 'rake'

task default: [:install]

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  files = %w[vimrc rubocop.yml]
  files.each do |file|
    system %(mkdir -p "$HOME/.#{File.dirname(file)}") if file =~ %r{/\/}
    file_name = File.join(ENV['HOME'], ".#{file}")
    if File.exist?(file_name)
      if File.identical? file, file_name
        puts "identical ~/.#{file}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %(ln -s "$PWD/#{file}" "$HOME/.#{file}")
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
