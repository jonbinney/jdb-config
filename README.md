# Jon's config file repo

## Installation instructions

Install packages we need for setting everything up.

```bash
sudo apt-get install git ansible
```

Create an ssh key pair.

```bash
ssh-keygen
```

Now add the key in `~/.ssh/id_rsa.pub` to github.

Clone this config repo.

```bash
git clone git@github.com:jonbinney/jdb-config config
```

Use the standard version of Ansible to install the newest PPA version of Ansible.

```bash
cd config/ansible
ansible-playbook -K -i "localhost," -c local update_ansible.yml
```

And finally run the ansible playbook to set everything up.

```bash
cd config/ansible
ansible-playbook -K -i "localhost," -c local config.yml
```
