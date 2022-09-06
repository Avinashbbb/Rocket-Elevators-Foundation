# config valid for current version and patch releases of Capistrano
lock "~> 3.17.0"

# set :rbenv_type, :user # or :system, or :fullstaq (for Fullstaq Ruby), depends on your rbenv setup
# set :rbenv_ruby, File.read('.ruby-version').strip
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails puma pumactl}
# set :rbenv_roles, :all # default value

set :application, "Avinash_Gopalakrishnan"
set :repo_url, "https://github.com/Avinashbbb/Rocket-Elevators-Foundation.git"
set :deploy_to, '/home/deploy/aws-rails'


set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}


namespace :deploy do
    desc 'Restart application'
    task :restart do
        on roles(:app), in: :sequence, wait: 5 do
            execute :touch, release_path.join('tmp/restart.txt')
        end
    end

    after :publishing, 'deploy:restart'
    after :finishing, 'deploy:cleanup'
end
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: "MIIEoAIBAAKCAQEAjGTXYyLbWHfLEBypJ+gNeDRryvHuY7illMBRJNrDDk+byoZv
nPaOgUR2QnAWuMMSXvTFQwEX5svdJOIBKqfoQoG5AQ1U/zyLd+qWOj1moasMWv1I
I8xkRWgb27TSmL2XWcvCQT/Wy0RjmnyR0ZiWHgkNrS45qPiLF9QrJ6xBlU6fvtG+
XbGW9wIK1KIKcAgvMr6JFXpYr9L/pQFHoL5tRxacqieRoPrFh94jZg24XGv74tyT
YzyAeteNSOZsabYTLUqDv8XAfUvjvPBlGAFGmzBX2nFNlULpBG+a5KYhwevdb7yB
QuafUroYsxhmS0p1Rh3olEv+Px9gNTSDCsG9VwIDAQABAoIBAHdWBEttRpuFgCMa
6aJVOpXRoUqpqOQ1APJXIuI73Y9dleRpr5fxcCJrKkbA9l9o2UXDs6WH2WRCJ6EB
RtKWVPOrRrGhPn2SXk65Jactp/6F4YO6RcbAJv9kRkHUCyrwBSW78Ev8Ur0HTc70
UhKiLAAt2+U4JKT/V2QS4ffgEQMyxoUKjlAYFJBliki4dgpffl7z8tejFwfDb+8L
slVFEF49PMCNI9AJsrd45GDtV3W7ONd9cgqQSGwgfO38B7laOwdzcJeEAi2+lqlC
yO35msPqYxWQrqijMBSNZoDy1P/su08zxoLAaaLAYJywiWowDmfvd1MqXgZd/rFW
Dect6VkCgYEAvc8Pa2UncVklbOzX1f3G3sGgUnrvavuh7rmX1hI36veV6UecmBXl
+7qYZAgkMsRQ2YM1VWkHu0TEweJm1/cS35PlyVAM+5TtFOBP6H9miNalzYKJoglv
MxWTQ9bhqtt1k2+OHRREG0cJoMk5GppuY6AcXWPV3+rYmN8mXorCpzsCgYEAvVpT
5weHPCe+bj1v1gPDg6uOo0w2kirV3s3BIMhC2NGl+YIa5hJKnJFc8jdx3Pexe1IC
DQDdDVJNxvRS8zIMYFsgk8QF35hBAldL4OqYLHFVuFSbQpkRN8By5Yxwqo8fKsGi
7eM/F0nX0VmwSJOOhtxSDPQPVwB1pcmldhGMuJUCgYBq8gXgHwiQRwhdTT13Zxvs
WvC4SGgpwUpGNfAlP/Kdw46F+EF1N7FzmnlOs3+h0xcy10jvrNQcYezyyVvlB2Ns
8eog+ae3APxsLM8ZUt807qxRFOHzmJk9EUT+jk5sdGbVAZ/zJn4RWH9GRtqT8LuO
CqKwxBW3qp0L1X/K+SggDQJ/dlf+GGacHvy4CC5dt2SizahrfaQkdzZOdPIjwlln
bhuZoFeweBr2huRTMw90Gqa0Rl766SWhArJt6erJ7TVaht5tfe0Fvrlp6AynX+s/
MIelC4/Vecow+KdPKCieQfsxf4eGTSe6RtPgDvf/NV0Dt0X8AhyHedjPrs5Ym3Jc
gQKBgGPFp9GOlc5OTkyobNoSMyfCaILnL7/nuJIQUs8NRbstrwB31iih8N462Hm8
1Zz5QfAYvWyij/tVkjhwNSnerGdxpWNL12hYLFJG9tuo2VR9HuwKNxS1BmuR3kEr
W6u61UCvBZqM2fYWuidRFSDBf81cMct6/892ZE5FAGARkbU6" }
# before "deploy:assets:precompile", "deploy:yarn_install"

# namespace :deploy do
#     desc 'Run rake yarn:install'
#     task :yarn_install do
#         on roles(:web) do
#             within release_path do
#                 execute("cd #{release_path} && yarn install")
#             end
#         end
#     end
# end











# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
