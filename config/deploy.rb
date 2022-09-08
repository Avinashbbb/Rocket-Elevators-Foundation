lock "~> 3.7"

set :application, 'aws-rails'
set :repo_url, 'https://github.com/Avinashbbb/Rocket-Elevators-Foundation.git'
set :deploy_to, '/home/deploy/Test3'
set :branch, 'main'

set :linked_files, %w{config/database.yml config/master.key}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  after :publishing, 'deploy:restart'
  after :publishing, 'deploy:cleanup'
end