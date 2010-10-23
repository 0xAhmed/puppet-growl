# Puppet-growl

## **Automatic syntax checking for your puppet manifests, instant notifications to your desktop using Growl**

* **Puppet-growl** is a ruby script that watches if there is any changes to your puppet manifests (by monitoring .pp files) and sends notifications to your desktop if the puppet manifest you just created/edited passes the syntax checks or not.
* It aims to facilitate the development of puppet code by sending instant notifications to your OS X desktop.

### Installation (OS X)

1. ``` sudo gem install eventmachine ruby-growl em-dir-watcher ```
2. Edit the "dir" variable in puppet-growl.rb with the full path of your puppet manifests.
3. Make sure to allow the following in Growl preferences: Listen for incoming connections, allow remote application registration.

### TODO
* Supporting libnotify under Linux.

