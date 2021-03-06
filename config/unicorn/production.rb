# ワーカーの数
worker_processes 2

# アプリケーションルート
rails_root = '/var/www/CLIPER_ADMIN_API/current/'

# ソケット
listen  File.expand_path('tmp/sockets/unicorn.sock', rails_root)
pid     File.expand_path('tmp/pids/unicorn.pid', rails_root)

# ログ
log = File.expand_path('log/unicorn.log', rails_root)
stderr_path File.expand_path('log/unicorn.log', rails_root)
stdout_path File.expand_path('log/unicorn.log', rails_root)

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
