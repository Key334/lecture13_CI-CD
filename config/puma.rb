app_dir = File.expand_path("../..", __FILE__)
bind "unix://#{app_dir}/tmp/sockets/puma.sock"
stdout_redirect "#{app_dir}/log/puma.stdout.log", "#{app_dir}/log/puma.stderr.log", true
workers 2
threads 1, 6
preload_app!
