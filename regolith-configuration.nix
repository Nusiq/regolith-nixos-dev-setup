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

        golang.go

        ms-python.python
        esbenp.prettier-vscode
        dbaeumer.vscode-eslint
        denoland.vscode-deno
        ms-dotnettools.csharp
        redhat.java
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        # Extensions that weren't listed in 'vscode-extensions'
        {
          name = "nimvscode";
          publisher = "nimsaem";
          version = "0.1.26";
          sha256 = "sha256-unxcnQR2ccsydVG3H13e+xYRnW+3/ArIuBt0HlCLKio=";
        }
      ];
    })

    # Version control system
    git
    gh
    
    # Used for compiling Regolith
    go
    
    # Languages supported by Regolith
    python312
    deno
    nodejs_22
    dotnet-sdk
    jdk
    nim
  ];
}
