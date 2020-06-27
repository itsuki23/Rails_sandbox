lock "3.12.1"

set :git_user, 'itsuki23'
set :application, "hitch_climb"

set :branch, "master"
set :deploy_to, "/var/www/#{fetch(:application)}"
set :repo_url, "https://github.com/#{fetch(:git_user)}/#{fetch(:application)}.git"

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/master.key', '.env')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'
set :rbenv_custom_path, '/usr/local/rbenv'
#
#set :rbenv_path, "/usr/local/rbenv"
#set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
#set :rbenv_map_bins, %w[rake gem bundle ruby rails]



set :ssh_options, { auth_methods: ['publickey'], forward_agent: true, keys: ['~/.ssh/raise.pem'] }

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
#set :unicorn_config_path, "/var/www/#{fetch(:application)}/current/config/unicorn/production.rb"

set :keep_releases, 3

SSHKit.config.command_map[:rake] = 'bundle exec rake'


after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

#set :default_env, {
#    rbenv_root: "/home/user/.rbenv",
#    path: "/home/user/.rbenv/bin:$PATH",
#    region: "ap-northeast-1",
#    aws_access_key_id:  <%= Rails.application.credentials.dig(:aws, :access_key_id) %>,
#    aws_secret_access_key: <%= Rails.application.credentials.dig(:aws, :secret_access_key) %>
#}




#namespace :before_deploy do
#
#  desc 'Upload .env, master.key, database.yml'
#  task :config_upload do
#    on roles(:app) do |host|
#      if test "[ ! -d #{shared_path}/config]"
#        execute "mkdir -p #{shared_path}/config"
#      end
#      upload!('.env', "#{shared_path}/.env")
#      upload!('config/master.key', "#{shared_path}/config/master.key")
#      upload!('config/database.yml', "#{shared_path}/config/database.yml")
#    end
#  end
#
#  desc 'Create database'
#  task :db_create do
#    on roles(:app) do
#      #within release_path do
#      with rails_env: fetch(:rails_env) do
#
#        #with rails_env: fetch(:rails_env) do
#        within current_path do
#
#          execute :bundle, :exec, :rake, "db:create"
#        end
#      end
#    end
#  end
#
#  desc 'start unicorn'
#  task :unicorn_start do
#    on roles(:app) do
#      invoke 'unicorn:start'
#    end
#  end
#
#end
