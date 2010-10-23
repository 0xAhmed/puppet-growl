#!/usr/bin/ruby -w

require 'rubygems'
require 'em-dir-watcher'
require 'ruby-growl'

# Growl host to send notifications to, make sure to allow the following in Growl preferences:
# Listen for incoming connections, allow remote application registeration
host = "127.0.0.1"
# Dir to watch puppet manifests, could be your puppet manifests under development
dir = "/etc/puppet"

EM.run {
  dw = EMDirWatcher.watch File.expand_path(dir), :include_only => ['*.pp'] do |paths|
    paths.each do |path|
      full_path = File.join(dir, path)
      puts "Full Path: #{full_path}"
      
      result = `puppet --parseonly #{full_path}`.chomp
    
      g = Growl.new host, "ruby-growl", ["ruby-growl Notification"]
      if result.any?
        g.notify "ruby-growl Notification", "Puppet", "Syntax Problem, Manifest #{full_path}: #{result}"
      else
        g.notify "ruby-growl Notification", "Puppet", "Manifest #{full_path}: Syntax OK"
        
      end      
    end    
  end
}