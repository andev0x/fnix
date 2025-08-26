{ pkgs, lib, ... }:

let
  installImSelect = pkgs.writeShellScriptBin "install-im-select" ''
    export PATH="${pkgs.lib.makeBinPath [ pkgs.curl pkgs.coreutils pkgs.bash ]}:$PATH"
    set -euo pipefail
    if ! command -v im-select &>/dev/null; then
      echo "Installing im-select..."
      curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh
    else
      echo "im-select already installed at: $(which im-select)"
    fi
  '';
in
{
  home.packages = [ installImSelect ];

  home.activation.installImSelect =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ${installImSelect}/bin/install-im-select
    '';
}

