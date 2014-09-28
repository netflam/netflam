# START STOP RESTART INSTALL CLEAN UPGRADE CONSOLE
task default: %w[start]

# START - Start cluster (redis & unicorn & nginx)
task :start do
  # Redis
  %x(redis-server ${PWD}/config/redis.conf)
  # Unicorn
  %x(unicorn -c ${PWD}/config/unicorn.rb -D)
  # Nginx
  %x(nginx -c ${PWD}/config/nginx.conf)

  puts "netflam started..."
end

# STOP - Stop cluster, removes .pid and .sock files
task :stop do
  # Kill processes
  %x(nginx -c ${PWD}/config/nginx.conf -s stop)
  %x(cat ${PWD}/tmp/pids/*.pid | xargs kill -KILL)
  # Remove files
  %x(rm ${PWD}/tmp/pids/*.pid)
  %x(rm ${PWD}/tmp/sockets/*.sock)

  puts "netflam stopped..."
end

# RESTART - Call stop and then start.
task :restart do
  Rake::Task[:stop].invoke
  Rake::Task[:start].invoke
end

# INSTALL - Install, prepare cluster
task :install do
  # Requires
  require "yaml"
  require "active_record"

  config = YAML::load_file('./config/sqlite.yml')
  # Resources
  %x(bundle)
  # Database
  ActiveRecord::Base.establish_connection(config)
  # Migrate
  ActiveRecord::Migrator.migrate('./db/migrate', ENV['VERSION'] ? ENV['VERSION'].to_i : nil)

  puts "netflam installed..."
end

# CLEAN - remove all files
task :clean do
  # Redis & Unicorn & Nginx
  %x(rm -rf ${PWD}/log/*)
  # Storage
  %x(rm -rf ${PWD}/tmp/dbs/*)
  # Lock
  %x(rm Gemfile.lock)

  puts "netflam logger files removed..."
end

# UPGRADE - upgrade project from official repository
task :upgrade do
  # Github
  %x(curl -L -o .cache http://github.com/netflam/netflam/archive/master.zip)
  %x(unzip .cache)
  %x(cp -r netflam-master/* .)
  %x(rm -rf .cache netflam-master)

  puts "netflam upgraded..."
end

# CONSOLE - launch a REPL with environment loaded.
task :console do
  $LOAD_PATH.unshift(File.join File.dirname(__FILE__), 'app')

  require 'bundler/setup'
  Bundler.require(:default)

  require 'active_record'
  require 'netflam'

  require 'irb'
  ARGV.clear && IRB.start
end
