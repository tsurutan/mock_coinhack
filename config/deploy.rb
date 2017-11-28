lock '3.8.1'
set :repo_url,        'git@github.com:tsurutan/mock_coinhack.git'
set :application,     'mock_coinhack'
set :user,            'deploy'
set :rbenv_type, :user
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

namespace :deploy do
  desc "Copying database.yml"
  task :config_database do
    on roles(:all) do
      within release_path do
        db_config_file = "/var/www/mock_coinhack/shared/database.yml"
        execute :cp, "#{db_config_file} ./config/database.yml"
      end
    end
  end
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

  desc "Set Environment Values"
  task :set_env_values do
    on roles(:all) do
      within release_path do
        env_config = "/var/www/mock_coinhack/shared/.env"
        execute :cp, "#{env_config} ./.env"
      end
    end
  end
  
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      invoke 'deploy'
    end
  end

  desc "Restart Application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before "deploy:updated", "deploy:config_database"
  before "deploy:updated", "deploy:set_env_values"
  before "deploy:updated", "deploy:printenv"
end