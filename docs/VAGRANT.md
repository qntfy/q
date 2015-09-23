# Using Q With Vagrant

Clone the Q repo and initialize the VM.

```
$ git clone https://github.com/qntfy/q.git
$ cd q
$ vagrant up
```

## Configuration

Some configuration options are at the top of the `Vagrantfile`.

| Variable                | Effect                                                        |
| ----------------------- | ------------------------------------------------------------- |
| `$num_instances `       | How many Q instances `vagrant up` will turn on (_default: 1_) |
| `$instance_name_prefix` | Instances are named prefix-01, prefix-02, etc (_default: q_)  |
| `$vm_gui `              | false = headless, true = gui (_default: false_)               |
| `$vm_memory`            | Amount of memory allocated per instance (_default: 1024KB_)   |
| `$vm_cpus`              | Number of virtual CPUs for VM (_default: 1_)                  |

## Running Q In A VM

The easiest way to run Q in a VM is to install both VirtualBox and Vagrant.

### Installing With Homebrew

```
brew cask install virtualbox
brew cask install vagrant
```

More information on Homebrew: [http://brew.sh](http://brew.sh).

### Installing By Hand

Download and install VirtualBox for your platform: [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)

Follow Vagrant's installation guide: [https://docs.vagrantup.com/v2/installation/](https://docs.vagrantup.com/v2/installation/)
