require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
require "capistrano/bundler"
require 'capistrano/rails'
require 'capistrano/puma'
require 'capistrano/rbenv'
install_plugin Capistrano::Puma
install_plugin Capistrano::SCM::Git
set :linked_files, %w{config/secrets.yml .env}

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
