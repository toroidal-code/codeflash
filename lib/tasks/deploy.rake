#Deploy and rollback on Heroku in production
task :deploy => ['deploy:push', 'deploy:restart', 'deploy:migrate']

namespace :deploy do
  APP = 'codeflash'

  task :push do
    puts 'Deploying site to Heroku ...'
    puts `git push -f git@heroku.com:#{APP}.git`
  end

  task :restart do
    puts 'Restarting app servers ...'
    puts `heroku restart --app #{APP}`
  end

  task :migrate do
    puts 'Running database migrations ...'
    puts `heroku rake db:migrate --app #{APP}`
  end

  task :off do
    puts 'Putting the app into maintenance mode ...'
    puts `heroku maintenance:on --app #{APP}`
  end

  task :on do
    puts 'Taking the app out of maintenance mode ...'
    puts `heroku maintenance:off --app #{APP}`
  end

end
