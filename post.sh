 
#nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixos.unstable
#nix-channel --update

wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.0.tar.gz
tar -xzvf elasticsearch-1.2.0.tar.gz
rm -f elasticsearch-1.2.0.tar.gz
elasticsearch-1.2.0/bin/plugin -i mobz/elasticsearch-head
elasticsearch-1.2.0/bin/plugin -i elasticsearch/marvel/latest
