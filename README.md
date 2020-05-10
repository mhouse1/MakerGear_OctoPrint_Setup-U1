forked from original on 5/9/2020 4:11pm

# OctoPrint-tfMGSetup
This plugin provides general setup and configuration interfaces for control of the MakerGear M3 Single and Independent Dual Extruder printers.

## Setup

We strongly recommend only using full Release versions of this plugin, as those have been fully tested and release for general use.



To install the absolute latest, currently testing version:

Install via the bundled [Plugin Manager](https://github.com/foosel/OctoPrint/wiki/Plugin:-Plugin-Manager)
or manually using this URL:

    https://github.com/mhouse1/MakerGear_OctoPrint_Setup-U1/archive/master.zip

# change hostname
The default hostname will be octopi If you only have 1 system on your network, this will probably be fine. Some users will have multiple systems and this will cause a problem with networking.

To change the hostname.

Log in via SSH (of if you have a screen & keyboard hooked up, use that). The default host is: octopi.local Username: pi Password: raspberry
At the command prompt type sudo nano /etc/hostname
Change the hostname from octopi to your preferred hostname. Do not leave spaces before or after and I would recommend keeping it all lowercase.
Ctrl-X and Y to save.
At the command prompt enter sudo nano /etc/hosts
Find the line with 127.0.1.1 and octopi
Replace octopi with exactly the same hostname as you entered into the hostname file. Note: This has to exactly match, so the same CaSE.
Reboot, using sudo reboot
