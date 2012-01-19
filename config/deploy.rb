require "bundler/capistrano"

set :application, "journal.oleander.nu"
set :domain, "journal.oleander.nu"
set :bundle_runner, "/usr/local/rvm/bin/webmaster_bundle exec"

# Git
set :scm, :git
set :repository, "git@github.com:oleander/journal-rb.git"
set :branch, "master"

# Config
role :web, application
role :app, application
role :db, application, :primary => true
set :deploy_to,  "/opt/www/journal.oleander.nu"
set :deploy_via, :remote_cache
set :keep_releases, 5
set :rails_env, "production"
set :git_enable_submodules, 1
set :git_shallow_clone, 1

# User
set :user, "webmaster"
set :use_sudo, false

# SSH
set :port, 2222
ssh_options[:paranoid] = false
ssh_options[:forward_agent] = true

# Bundler
set :bundle_without, [:test, :development]
set :bundle_flags,    "--deployment --without=development,test"

namespace :deploy do
  task :start, :roles => :app do ;end
    
  desc "Restarting passenger"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{deploy_to}/current && touch tmp/restart.txt"
  end
  
  task :assets, :roles => :app do
    run "cd #{deploy_to}/current && RAILS_ENV=production #{bundle_runner} rake assets:precompile"
  end
  
  task :copy_files, :roles => :app do
    run "cp -ax #{shared_path}/config.yml #{release_path}/config/"
    run "cp -ax #{shared_path}/database.yml #{release_path}/config/"
  end
  
  after "deploy:update", "deploy:copy_files"
  after "deploy:copy_files", "deploy:assets"
  after "deploy:assets", "deploy:cleanup"
end