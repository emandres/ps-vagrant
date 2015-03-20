# ps-vagrant

Vagrant setup for running RabbitMQ, Redis, and Cassandra in a virtual machine.


## Setup Instructions

1. If you haven't installed [Vagrant](https://www.vagrantup.com/downloads.html)
    or [VirtualBox](https://www.virtualbox.org/wiki/Downloads) yet, do so.
2. Run `vagrant up` to create and run the virtual machine.

The virtual machine will set up several local IP addresses.
Once running:
* RabbitMQ should be available at 172.19.0.2:5672
** with the management plugin at http://172.19.0.2:15672
* Redis should now be available at 172.19.0.3:6379.
* Cassandra should be available at 172.19.0.4 with ports 7000, 9160, and 9042 open.

### Hosts Entries

Adding the following entries to your `hosts` file will make things easier:

```
172.19.0.2	rabbit.local
172.19.0.3	redis.local
172.19.0.4	cassandra.local
```


## RAM Usage

The [Vagrantfile](./Vagrantfile) will give the virtual machine 2048 MB (2 GB).
For running on laptops, you may wish to reduce this to 1024 MB (1 GB).
Alternatively, on a pairing station, you may wish to increase memory.

For Cassandra specifically, you can change how much heap memory is provided
by altering the `sed` commands used in the [bootstrap.sh](./bootstrap.sh) file.
