nix-env -i wget
umount -a
echo -e "d\nw" |fdisk /dev/sda
fdisk -l /dev/sda
echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/sda
mke2fs -L nixos -t ext4 /dev/sda1
fdisk -l /dev/sda
mount /dev/disk/by-label/nixos /mnt
nixos-generate-config --root /mnt
cp configuration.nix /mnt/etc/nixos/configuration.nix
cp post.sh /mnt/post.sh

#mkdir /mnt/apps
#cd /mnt/apps
#pwd
#git clone https://github.com/elixir-lang/elixir
#git clone https://github.com/elixir-lang/dynamo
#tar -xzvf elasticsearch-1.2.0.tar.gz
#rm -f elasticsearch-1.2.0.tar.gz

nixos-install

