nix-env -i wget
echo -e "d\nw" |fdisk /dev/sda
umount -a
fdisk -l /dev/sda
echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/sda
mke2fs -L nixos -t ext4 /dev/sda1
fdisk -l /dev/sda
mount /dev/disk/by-label/nixos /mnt
nixos-generate-config --root /mnt
cp configuration.nix /mnt/etc/nixos/configuration.nix
echo "root:toor"|chpasswd

cd /mnt/
mkdir apps
cd apps
git clone https://github.com/elixir-lang/elixir
git clone https://github.com/elixir-lang/dynamo
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.0.tar.gz
tar -xzvf elasticsearch-1.2.0.tar.gz
#alias mix='/apps/bin/mix'
nixos-install
echo "nixxin:test"|chpasswd