# Jon's config file repo

## Installation instructions

Install packages we need for setting everything up.

```bash
sudo apt install git ansible
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
ansible-playbook -K -i "localhost," -c local config.yml
```

Remap CapsLock key to be a second control: run `gnome-tweaks` (installed by ansible playbook
already), go to `Keyboard & Mouse->Additional Layout Options` -> Caps Lock behavior. Select "Make
Caps Lock an additional Esc".
