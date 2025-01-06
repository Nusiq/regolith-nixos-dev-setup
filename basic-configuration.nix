{ config, pkgs, ... }:
{
  # Enable Guest Additions for Virtualbox
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

  # Install packages
  environment.systemPackages = with pkgs; [

    # Vscodium and its extensions. A free alternative to "vscode" that
    # doesn't reguire using the 'nixpkgs.config.allowUnfree = false;'
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
      ];
    })

    # Version control system
    git
    gh
  ];
}
