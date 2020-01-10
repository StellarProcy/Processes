another_pid = Process.pid
pid = fork do
  Signal.trap("USR1") do
    $stdout.syswrite("This is Hello world message\nTry to kill the process...\n...\n...\n...\n")
    Process.kill("QUIT", another_pid)
    exit
  end
end

trap("QUIT") {puts "Successful! Bye, have a nice day!"; exit!}
Process.kill("USR1", pid)
Process.wait
