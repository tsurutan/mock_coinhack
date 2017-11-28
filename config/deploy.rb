lock '3.8.1'
set :repo_url,        'git@github.com:tsurutan/mock_coinhack.git'
set :application,     'mock_coinhack'
set :user,            'deploy'
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :confirm do
    on roles(:app) do
      puts "This stage is '#{fetch(:stage)}'. Deploying branch is '#{fetch(:branch)}'."
      puts 'Are you sure? [y/n]'
      ask :answer, 'n'
      if fetch(:answer) != 'y'
        puts 'deploy stopped'
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      invoke 'deploy'
    end
  end

  before :starting, :confirm
end