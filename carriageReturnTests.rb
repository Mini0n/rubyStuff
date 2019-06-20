
param = ARGV

test = "ola k ase... " + param.to_s
puts test

test += "\r" + "ola k kiere?"
puts test

t = $stdin.gets.chomp.to_i

1.step(limit=t) {|i| sleep 0.2; print "\b" + "|/-\\"[i%4] }