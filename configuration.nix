# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
imports =
[ # Include the results of the hardware scan.
./hardware-configuration.nix
];

# Use the GRUB 2 boot loader.
boot.loader.grub.enable = true;
boot.loader.grub.version = 2;
# Define on which hard drive you want to install Grub.
boot.loader.grub.device = "/dev/sda";

networking.hostName = "Sadik"; # Define your hostname.
# networking.wireless.enable = true; # Enables wireless.
networking.enableIPv6 = false ;
networking.firewall.allowedTCPPorts =[ 80 443 22 ];
networking.firewall.allowPing = true ;
networking.firewall.enable =true ;

# Select internationalisation properties.
# i18n = {
# consoleFont = "lat9w-16";
# consoleKeyMap = "us";
# defaultLocale = "en_US.UTF-8";
# };





# List packages installed in system profile. To search by name, run:
# -env -qaP | grep wget
environment.systemPackages = with pkgs; [
#ruby
wget
#htop
gitFull
#firefoxWrapper 
#unrar
#vim
#icedtea7_web 
busybox
#p7zip
#openvpn
openjdk
#gparted
#dmenu
#zsh
autoconf
#xorg.xkill
automake
nixops
gcc 
mercurial 
fish
bzip2
#python
#lynx
gnumake
cmake
#erlang
#elixir
];



# List services that you want to enable:

# Enable the OpenSSH daemon.
services.openssh.enable = true;

# Enable CUPS to print documents.
# services.printing.enable = true;

# Enable the X11 windowing system.
services.xserver.enable = true;
services.xserver.layout = "us";
services.xserver.xkbOptions = "eurosign:e";
services.xserver.videoDriver = "virtualbox";

# Enable the Desktop Environment.

 services.xserver.displayManager.slim.enable = true;
 services.xserver.desktopManager.xfce.enable = true;

services.virtualbox.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
users.extraUsers.guest = {
name = "test";
password = "test";
extraGroups = [ "wheel" ];
group = "users";
uid = 1000;
createHome = true;
home = "/home/test";
shell = "/run/current-system/sw/bin/bash";

};

security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

} 
