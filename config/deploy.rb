require 'bundler/capistrano'
#require 'deploy/database'
require 'capistrano_colors'
# require "rvm/capistrano"
#require 'airbrake/capistrano'
#require 'hipchat/capistrano'

set :application, "isle-of-iona"
set :repository,  "git@github.com:omargallob/welcome2iona.git"

set :scm, :git

set :use_sudo, false


# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web,          "178.79.161.32"
role :app,          "178.79.161.32"
role :db,           "178.79.161.32", :primary => true
                    
set :rails_env,     "production"
set :branch,        "master"
set :user,          "deploy"
set :password,      "kelpie2012"

# set :rvm_ruby_string, 'ruby-1.9.3-p392'
# set :rvm_type, :local
set :deploy_to, "/home/deploy/isle-of-iona"
set :rails_root, "/home/deploy/isle-of-iona/current"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

end

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end

after "deploy", "rvm:trust_rvmrc"
