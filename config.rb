
# To automatically replace the discovery token on 'vagrant up', uncomment
# the lines below:
#
#if File.exists?('user-data') && ARGV[0].eql?('up')
#  require 'open-uri'
#  require 'yaml'
# 
#  token = open('https://discovery.etcd.io/new').read
# 
#  data = YAML.load(IO.readlines('user-data')[1..-1].join)
#  data['coreos']['etcd']['discovery'] = token
# 
#  lines = YAML.dump(data).split("\n")
#  lines[0] = '#cloud-config'
# 
#  open('user-data', 'r+') do |f|
#    f.puts(lines.join("\n"))
#  end
#end
##
#
# coreos-vagrant is configured through a series of configuration
# options (global ruby variables) which are detailed below. To modify
# these options, first copy this file to "config.rb". Then simply
# uncomment the necessary lines, leaving the $, and replace everything
# after the equals sign..

# Size of the CoreOS cluster created by Vagrant
$num_instances= 1 

# Official CoreOS channel from which updates should be downloaded
$update_channel='alpha'
#$update_channel='stable'

# Log the serial consoles of CoreOS VMs to log/
# Enable by setting value to true, disable with false
# WARNING: Serial logging is known to result in extremely high CPU usage with
# VirtualBox, so should only be used in debugging situations
#$enable_serial_logging=false

# Enable port forwarding of Docker TCP socket
# Set to the TCP port you want exposed on the *host* machine, default is 2375
# If 2375 is used, Vagrant will auto-increment (e.g. in the case of $num_instances > 1)
# You can then use the docker tool locally by setting the following env var:
#   export DOCKER_HOST='tcp://127.0.0.1:2375'
#$expose_docker_tcp=2375
# [guest port: host port]
$forwared_ports=[[8021,8021],[8080,8080],[5432,5432],[3306,3306],[27017,27017],[4001,4001],[2550,2550],[2235,2235],[2234,2234],[1100,110],[1430,143],[6379,6379]]
# Setting for VirtualBox VMs
#$vb_gui = false
#$vb_memory = 1024
#$vb_cpus = 1
