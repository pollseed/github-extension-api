require_relative '../common/constants'

@dir =
  if ENV['RACK_ENV'] == System::DEV_MODE
    "#{ENV['HOME']}/workspace/ruby/github-extension-api/"
  else
    "/path/to/deploy/application/current/"
  end

worker_processes 1
working_directory @dir

timeout 300

listen "#{@dir}tmp/pids/unicorn.sock"
pid "#{@dir}tmp/pids/unicorn.pid"

stderr_path "#{@dir}log/unicorn.stderr.log"
stdout_path "#{@dir}log/unicorn.stdout.log"
