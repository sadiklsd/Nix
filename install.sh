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

cd /mnt/
mkdir apps
cd apps
pwd
git clone https://github.com/elixir-lang/elixir
git clone https://github.com/elixir-lang/dynamo
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.0.tar.gz
tar -xzvf elasticsearch-1.2.0.tar.gz
rm -f elasticsearch-1.2.0.tar.gz

nixos-install
echo "Enter New Root Password:"
passwd
useradd -m nixxin
echo "nixxin:test" |chpasswd

echo "alias mix='/apps/bin/mix'">> /home/nixxin/.bashrc

