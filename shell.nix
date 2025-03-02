{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.miniconda3
    pkgs.git
    pkgs.python3
  ];

  shellHook = ''
    # Initialize conda in the shell
    export PATH="$PWD/miniconda/bin:$PATH"
    if [ ! -d "$PWD/miniconda" ]; then
      echo "Installing Miniconda..."
      mkdir -p miniconda
      curl -L https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86-64.sh - o miniconda.sh
      bash miniconda.sh -b -p $PWD/miniconda
      rm miniconda.sh
    fi
    conda init bash
    source $PWD/miniconda/bin/activate
  '';
}