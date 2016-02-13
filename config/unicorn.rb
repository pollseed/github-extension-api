#@dir = "/path/to/app/"
@dir = "#{ENV['HOME']}/workspace/ruby/github-extension-api/"

worker_processes 1
working_directory @dir

timeout 300

listen "#{@dir}tmp/pids/unicorn.sock"
pid "#{@dir}tmp/pids/unicorn.pid"

stderr_path "#{@dir}log/unicorn.stderr.log"
stdout_path "#{@dir}log/unicorn.stdout.log"
