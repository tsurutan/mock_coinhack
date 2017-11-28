# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "mock_coinhack"
set :repo_url, "git@example.com:me/my_repo.git"

set :deploy_to, '/home/ユーザー名/アプリ名/'

set :keep_releases, 5
set :ssh_options, :port => "ポート番号"

set :rbenv_type, :system # :system or :user
set :rbenv_ruby, '2.3.1'#rubyのバージョン

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

set :linked_dirs, %w{bin log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle}
set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"

set :bundle_jobs, 4

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
