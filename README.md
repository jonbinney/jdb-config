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

And finally run the ansible playbook to set everything up.

```bash
cd config/ansible
ansible-playbook -i "localhost," -c local config.ym
```
