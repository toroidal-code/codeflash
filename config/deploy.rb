require "bundler/capistrano"
require "bundler/setup"

set :rvm_ruby_string, 'rbx-head'
set :rvm_install_ruby_params, '--1.9'      # for jruby/rbx default to 1.9 mode

#before 'deploy:setup', 'rvm:install_rvm'   # install RVM
#before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, or:

#before 'deploy:migrate', 'deploy:setup_db'  # do this on first run of deploy

require "rvm/capistrano"

set :domain, 'deb5610.student.rit.edu'
set :applicationdir, "/home/deploy/codeflash"

set :application, "codeflash"
set :repository, "git@github.com:codeflash/codeflash.git"
set :branch, "dev"
ssh_options[:forward_agent] = false

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :scm_verbose, true

set :user, "deploy" #The server's user for deploys
set :use_sudo, false

# roles (servers)
role :web, domain                         # Your HTTP server, Apache/etc
role :app, domain                         # This may be the same as your `Web` server
role :db, domain, primary: true           # This is where Rails migrations will run

# deploy config
set :deploy_to, applicationdir
set :deploy_via, :remote_cache

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", "deploy:migrate"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
namespace :deploy do
    task :setup_db, roles: :app do
        run "cd #{release_path}; bundle exec rake db:setup RAILS_ENV=#{rails_env}"
    end
end

#========================
#CUSTOM
#========================
namespace :puma do
  desc "Start Puma"
    task :start, :except => { :no_release => true } do
        run "/etc/init.d/puma start #{application}"
  end
  after "deploy:start", "puma:start"

  desc "Stop Puma"
    task :stop, :except => { :no_release => true } do
        run "/etc/init.d/puma stop #{application}"
  end
  after "deploy:stop", "puma:stop"

  desc "Restart Puma"
  task :restart, roles: :app do
        run "/etc/init.d/puma restart #{application}"
  end
  after "deploy:restart", "puma:restart"

  desc "create a shared tmp dir for puma state files"
  task :after_symlink, roles: :app do
        run "rm -rf #{release_path}/tmp"
        run "ln -s #{shared_path}/tmp #{release_path}/tmp"
  end
  after "deploy:create_symlink", "puma:after_symlink"
end
