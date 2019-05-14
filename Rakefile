# https://github.com/phstc/dotfiles/blob/master/Rakefile

require 'rake'

task default: [:install]

desc "install the dot files into user's home directory"
task :install do
  update_git_submodules
end

def update_git_submodules
  puts 'updating git-submodules'
  system 'git submodule init'
  system 'git submodule update'
  # system 'git submodule -q foreach git pull -q origin master'
end
