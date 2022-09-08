server '15.222.246.1',user: 'deploy', roles: %w{web app db}
set :rails_env, 'production'