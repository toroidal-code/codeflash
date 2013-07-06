require "bundler/capistrano"
require "bundler/setup"

# RVM config
set :rvm_ruby_string, 'rbx-head'
set :rvm_install_ruby_params, '--1.9'      # for jruby/rbx default to 1.9 mode
set :rvm_type, :system
require "rvm/capistrano"

#before 'deploy:migrate', 'deploy:setup_db'  # do this on first run of deploy

#Application config
set :domain, 'deb5610.student.rit.edu'
set :applicationdir, "/home/deploy/codeflash"
set :application, "codeflash"

# VCS config
set :repository, "git@github.com:codeflash/codeflash.git"
set :branch, "dev"
ssh_options[:forward_agent] = false
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :scm_verbose, true

# Permissions
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
#after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", "deploy:migrate"

namespace :deploy do
    task :setup_db, roles: :app do
        run "cd #{release_path}; bundle exec rake db:setup RAILS_ENV=#{rails_env}"
    end
end

namespace :puma do
  desc "Start Puma"
    task :start, :except => { :no_release => true } do
      run " /sbin/start-stop-daemon --verbose --start --chdir /home/deploy/codeflash/current/ --chuid deploy --background --exec /usr/local/bin/run-puma -- /home/deploy/codeflash/current /home/deploy/codeflash/current/config/puma.rb /home/deploy/codeflash/current/log/puma.log"
  end
  after "deploy:start", "puma:start"

  desc "Stop Puma"
    task :stop, :except => { :no_release => true } do
      run "pumactl --state #{shared_path}/tmp/puma/state stop"
  end
  after "deploy:stop", "puma:stop"

  desc "Restart Puma"
  task :restart, roles: :app do
    run "pumactl --state #{shared_path}/tmp/puma/state restart"
  end
  after "deploy:restart", "puma:restart"

  desc "create a shared tmp dir for puma state files"
  task :after_symlink, roles: :app do
    run "rm -rf #{release_path}/tmp"
    run "ln -s #{shared_path}/tmp #{release_path}/tmp"
  end
  after "deploy:create_symlink", "puma:after_symlink"
end

namespace :newrelic do
  desc "Copy newrelic.yml"
    task :copy do 
      run "cp /home/deploy/newrelic/config/newrelic.yml #{release_path}/config/newrelic.yml"
  end
  after "deploy:create_symlink", "newrelic:copy"
end
