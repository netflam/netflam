preload_app true

worker_processes 16
working_directory "/home/netflam"

timeout 30

# Set process id path
pid "/home/netflam/tmp/pids/unicorn.pid"

# Specify path to socket unicorn listens to,
# we will use this in our nginx.conf later
listen "/home/netflam/tmp/sockets/unicorn.sock", :backlog => 2048

# Set log file paths
stderr_path "/home/netflam/log/unicorn.stderr.log"
stdout_path "/home/netflam/log/unicorn.stdout.log"