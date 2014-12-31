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

  namespace :dotenv do

    desc "Generate the .env vars file"
    task :setup do
      on roles :app do
        #https://github.com/capistrano/sshkit/blob/master/EXAMPLES.md#upload-a-file-from-a-stream
        info "Uploading #{shared_path}/config/.env"
        file = "dotenv"
        smart_template file, ".env"
      end
    end
    after "deploy:started", "deploy:dotenv:setup"

    desc "Symlink the .rbenv-vars file into latest release"
    task :symlink do
      on roles :app do
        execute :ln, '-nfs', "#{shared_path}/config/.env", "#{release_path}/.env"
      end
    end
    before "deploy:updated", "deploy:dotenv:symlink"

  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
