# strongspace cookbook

# Requirements

Ubuntu 12.0.4LTS.

An account at [Strongspace](https://www.strongspace.com).

Chef.

# Usage

Modify the attributes to taste.

Include `strongspace::default` in your run list.

Add the emailed SSH Key to your Strongspace Account.

Run `/etc/cron.daily/strongspace-rsync` once to make sure you're good.

# Attributes

	default[:strongspace][:username] = "username-goes-here"
	default[:strongspace][:hostname] = "domain-goes-here.strongspace.com"
	default[:strongspace][:path] = "/path/to/backup/files"
	default[:strongspace][:email] = "emails-to-notify-ssh-key@example.com"
	default[:strongspace][:directories] = ["/etc", "/usr/local/sbin", "/root", "/home", "/var/www"]
	default[:strongspace][:command] = "rsync -avz --delete"

# Author

Author:: Darron Froese (<darron@froese.org>)