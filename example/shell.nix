# for development

{ pkgs ?  import <nixpkgs> {} }:

let

  terranix = import ../lib.nix { inherit (pkgs) writeShellScriptBin pandoc stdenv; };

in pkgs.mkShell {

  # needed pkgs
  # -----------
  buildInputs = with pkgs; [
    terranix.terranix
    terranix.terranixTrace
    (terranix.manpage "3.3.3")
    terraform
  ];

  # run this on start
  # -----------------
  shellHook = ''
    HISTFILE=${toString ./.}/.history
  '';
}