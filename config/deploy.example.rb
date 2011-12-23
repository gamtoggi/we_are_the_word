require "bundler/capistrano" # automatically run "bundle install".

#app
set :application, "fishcake"

# git
set :scm, :git
set :repository,  "git://github.com/gamtoggi/fishcake.git"
set :git_shallow_clone, 1
     
# server
server "your_server.com", :app, :web, :db, :primary => true
set :user, "root" 
set :deploy_to, "/your_deploy_path/fishcake"


namespace :deploy do
  # passenger tasks
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  namespace :db do
    task :symlink, :except => { :no_release => true } do
      run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
    end
  end
  
  namespace :assets do
    task :precompile do
      run "cd #{current_release}; RAILS_ENV=#{rails_env} bundle exec rake assets:precompile"
    end
  end
  
  after "deploy:finalize_update", "deploy:db:symlink"
  after "deploy:finalize_update", "deploy:assets:precompile"
end


