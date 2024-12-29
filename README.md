# NixOS Regolith Config

This project contains a tutorial and resources for setting up [NixOS](https://nixos.org/) to run all possible types of [Regolith](https://github.com/Bedrock-OSS/regolith) filters.

The goal of this repository is to provide an easy to set up desktop environment for testing if all of the Regolith features work as intended. The tutorial should be easy to follow for advanced users. It doesn't exactly explain all of the details but it should be enough if you are familiar vith virtual machines and Regolith.

All instructions can be found below, in the following sections.

> [!WARNING]
> Currently this repository only provides a Nix configuration file. I'm not a NixOS user and I needed a quick and dirty setup that is easy to reproduce on a virtual machine (all described below).
>
> In the fututre additional configuration files, like Nix flakes or shell may be added to this repository, but for now I'm not familiar with these features.

# Installing Virtualbox & NixOS

There is no need to explain the same thing people described well already. Here is a tutorial that shows how to insall VirtualBox and NixOS: https://itsfoss.com/install-nixos-vm/

> [!NOTE]
> When I was setting up my virtual machine, initially I had painfully bad performance. Here are settings that wokred for me. They may be different for you:
> - I moved most of the sliders below the maximum green area on the sliders
> - Base Memory: 16834 MB (below the green limit on the slider)
> - Processors: 4 CPUs (below the green limit on the slider)
> - Execution cap: 100% (max value)
> - Display -> Video Memory: 128 MB (max value)
> - Display -> Graphics Controller: VMSVGA (my guess is this is probably the only setting that mattered that I changed form the default but once I got something that works I didn't bother to check which settings were important)
> - Display -> Enable 3D Acceleration: True
>
> Maybe enabling Guest Additions was also helpful (it's in the config described later). I applied all of the changes at once so I don't know.

# Nix Configuration

The configuration file privoided in this repository installs all of the dependencies needed to compile Regolith and to run every possible filter kind Regolith supports.

The configuration file is in: `regolith-configuration.nix`

Simply copy the file into the `/etc/nixos` directory and add it to the imports in the `/etc/nixos/configuration.nix` file:

```nix
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./regolith-configuration.nix  # <=== this imports Regolith configuration 
    ];
```

After that you need to rebuild your system. Run the following command:
```text
sudo nixos-rebuild switch
```

This configuration installs:

- VSCodium with some plugins for Regolith filter development
- Git & GitHub CLI
- Go
- Python 3.12
- Deno
- NodeJS v22
- .NET SDK
- OpenJDK
- Nim

The dependencies aren't version locked on purpose. If something breaks I want to know it.

# Installing Regolith

The configuration installs Git and Go for you so you can download Regolith repository and build it yourself.

The GitHub repositoryt: https://github.com/Bedrock-OSS/regolith

You can download regolith using Git (`cd` into your prefered location and run):
```text
git clone https://github.com/Bedrock-OSS/regolith.git
```
Or you can use GitHub CLI:
```text
gh repo clone Bedrock-OSS/regolith
```

After downloading `cd` into `regolith` and install the application using Go:
```text
go install
```

# Running Regolith
After installation you should be able to run Regolith using:
```text
~/go/bin/regolith
```
The `go install` command by default installs the applications into `~/go/bin/` folder. If you want you can add it to your PATH using:
```text
export PATH="$HOME/go/bin:$PATH"
```
This works only for the current terminal session but you can add it to your `~/.bashrc`, or use whatever method is "correct" on NixOS.
