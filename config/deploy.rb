require "bundler/capistrano"
require "bundler/setup"

set :rvm_ruby_string, 'rbx-head'
set :rvm_install_ruby_params, '--1.9'      # for jruby/rbx default to 1.9 mode

#before 'deploy:setup', 'rvm:install_rvm'   # install RVM
#before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, or:

#before 'deploy:migrate', 'deploy:setup_db'  # do this on first run of deploy

require "rvm/capistrano"

set :domain, 'dev5610.student.rit.edu'
set :applicationdir, "/home/deploy/codeflash"

set :application, "codeflash"
set :repository,  "git@github.com:codeflash/codeflash.git"
set :branch, "dev"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :scm_verbose, true

set :user, "deploy" #The server's user for deploys
set :use_sudo, false

# roles (servers)
role :web, domain                         # Your HTTP server, Apache/etc
role :app, domain                         # This may be the same as your `Web` server
role :db, domain, :primary => true        # This is where Rails migrations will run

# deploy config
set :deploy_to, applicationdir
set :deploy_via, :remote_cache

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", "deploy:migrate"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
namespace :deploy do
    task :setup_db, :roles => :app do
        run "cd #{release_path}; bundle exec rake db:setup RAILS_ENV=#{rails_env}"
    end
end
