# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :rbenv_type, :user
set :rbenv_ruby, "2.6.1"

set :application, "ssylki"
set :repo_url, "git@github.com:HeadExchange/HSEADCS-Ssylki.git"

# Default branch is :master
set :branch, "polishing_merge"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deployer/apps/#{fetch :application}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/master.key', 'config/puma.rb')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :puma_init_active_record, true
set :puma_conf, -> { File.join(shared_path, 'config', 'puma.rb') }


desc "Run rake task on server. Usage example: cap production rake task=import:products"

task :rake do
  on roles(:app), in: :sequence, wait: 5 do
    within release_path do
      with rails_env: :production do
        execute :rake, ENV['task'], "RAILS_ENV=production"
      end
    end
  end
end
