pkgs = import <nixpkgs> {};
stdenv = pkgs.stdenv;
ruby = pkgs.ruby2;

installGem = {name, opts ? ""}: stdenv.mkDerivation rec {
        inherit name;
        src = ./.;
        dontStrip = true;
        phases = [ "installPhase" ];
        buildInputs = [ ruby ];
        installPhase = ''
                export HOME=$TMP

                GEM_PATH="$GEM_PATH:$out/${ruby.gemPath}"

                gem install --install-dir "$out/${ruby.gemPath}" \
                        --bindir "$out/bin" --no-rdoc --no-ri ${name}
        '';
};

gem = name: installGem {name = name;};
in
        stdenv.mkDerivation rec {
                basename = "BitFramework";
                version = "0.0.1";
                name = "${basename}-${version}";
                src = ./.;

                phases = [ "buildPhase" "installPhase" ];
                propagatedBuildInputs = [
                        ruby
                        (gem "bundler")
                ];
                buildPhase = ''
                        echo 'building app'
                '';
                installPhase = ''
                        echo 'install app'
                '';
        }
