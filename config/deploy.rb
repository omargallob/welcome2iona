require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'capistrano_colors'

set :stages, %w(production staging)
set :default_stage, "production"


set :application, 'welcometoiona'
set :repository, 'git@github.com:omargallob/welcome2iona.git'
set :branch, :master

set :deploy_to, "/home/deploy/welcome2iona"
set :rails_root, "/home/deploy/welcome2iona/current"

set :use_sudo,              false
ssh_options[:paranoid]  =   false

set :deploy_via, :copy


set :rvm_type, :system
set :rvm_ruby_string, 'ruby-1.9.3-p327'

require "rvm/capistrano"

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5


namespace :deploy do

  # desc 'Restart application'
  # task :restart do
  #   on roles(:app), in: :sequence, wait: 5 do
  #     # Your restart mechanism here, for example:
  #     # execute :touch, release_path.join('tmp/restart.txt')
  #   end
  # end

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end

  after :finishing, 'deploy:cleanup'

end