# New computer setup

---

## If second-hand
### Format the drive

1. Restart with cmd-R or cmd-D
2. Erase drive / 3x if second-hand
3. Reinstall MacOS

---

## First boot

### Change system password.

### System Prefs
```
  Network
      add Google DNS (https://developers.google.com/speed/public-dns/)
      8.8.8.8
      4.4.4.4
      add Open DNS (http://www.opendns.com/opendns-ip-addresses/)
      208.67.222.222
      208.67.220.220
```


### Setup SSH keys for Github

- Setup ssh keys for github use:
  ```
  ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
  ```
- Start the ssh-agent:
  ```
  eval "$(ssh-agent -s)"
  ```
- Add the ssh key to the agent:
  ```
  ssh-add -K ~/.ssh/id_rsa # -K for Mac OS X keychain persistence
  ```
- Get copy of public key:
  ```
  pbcopy < ~/.ssh/id_rsa.pub # paste into GitHub GUI
  ```
- Create new ssh key pairing via github.com: Settings > SSH > New SSH key
- Test setup:
  ```
  ssh -T git@github.com
  ```

### Clone dotfiles repo via SSH

```
cd ~
git clone git@github.com:phamann/dotfiles.git
mv dotfiles .dotfiles
```

### Run doftiles bootscript

```
cd ~/.dotfiles
script/bootstrap
scropt/install
```

### Post bootscript setup

- Restart iTerm
- Test vim setup
- Test tmux setup
- Sync iTerm preferences via Dropbox

### 

### Setup Chrome

- Login to [LastPass](https://lastpass.com/)
- Copy main Google account password to clipboard
- Login to Chrome
- Ensure all settings and extensions are syncing
- Repeat steps for Chrome Canary

### Setup DropBox

- Open DropBox app
- Login using credentials from LastPass
- Setup sync
- Symlink Documents, Code, Personal

### Install virtual machines

- Download [ievms](//github.com/xdissent/ievms)
- `curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | bash`

----

## Additions

### Change desktop background

- [Suggestion 1](http://pichost.me/1793017/)
- [Suggestion 2](http://pichost.me/1978561/)
- [Suggestion 3](http://howaboutorange.blogspot.co.uk/2012/09/geometric-desktop-wallpapers.html)

