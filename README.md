# Jon's config file repo

## Installation instructions

```bash
ssh-keygen
```

Now add the key in `~/.ssh/id_rsa.pub` to github.

```bash
cd
git clone git@github.com:jonbinney/jdb-config config
cd config
```

And finally run the ansible playbook to set everything up.

```bash
sudo apt-get install git ansible
ssh-keygen (enter enter enter)
<add ssh key to github account>
git clone git@github.com:jonbinney/jdb-config config
cd config/ansible
ansible-playbook -i "localhost," -c local config.ym
```
