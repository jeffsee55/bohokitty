# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'bohokitty'
set :repo_url, 'git@github.com:jeffsee55/bohokitty.git'

set :deploy_to, '/home/deploy/bohokitty'

set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc "Database config"
  task :setup_config, roles: :app do
    # upload you database.yml from config dir to shared dir on server
    put File.read("config/database.yml"), "#{shared_path}/config/database.yml"
    # make symlink
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    # upload you database.yml from config dir to shared dir on server
    put File.read(".env"), "#{shared_path}/config/.env"
    # make symlink
    run "ln -nfs #{shared_path}/config/.env #{current_path}/.env"
  end

  before :publishing, 'deploy:setup_config'

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
