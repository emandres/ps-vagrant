Setup Instructions
==================

0. If you haven't installed Vagrant yet, [do so](https://www.vagrantup.com/downloads.html).
1. `vagrant init`
2. Redis should now be available on port 6379. RabbitMQ should now be available on ports 5672 and 15672 for the server and manager, respectively.

This setup makes these services available as if they were running on the machine (through port forwarding). In the future it might be nice to have the Vagrant machine act as a separate system addressable with a host name.
