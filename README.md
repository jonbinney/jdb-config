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

Optional: remap CapsLock key to be a second control. Install
gnome-tweak tool with `sudo apt-get install gnome-tweak-tool`,
run `gnome-tweaks`, go to `Keyboard & Mouse->Additional Layout Options`
-> Caps Lock behavior. Select "Make Caps Lock an additional Esc".
