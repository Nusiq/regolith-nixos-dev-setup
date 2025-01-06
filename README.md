# NixOS Regolith Config

This project contains a tutorial and resources for setting up [NixOS](https://nixos.org/) to run all possible types of [Regolith](https://github.com/Bedrock-OSS/regolith) filters.

The goal of this repository is to provide an easy to set up desktop environment for testing if all of the Regolith features work as intended. The tutorial should be easy to follow for advanced users. It doesn't exactly explain all of the details but it should be enough if you are familiar vith virtual machines and Regolith.

All instructions can be found below, in the following sections.

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

I included the `basic-configuration.nix` in this project for people who just want to setup very basic virtualmachine. It adds `git` and VSCodium. Adding it to your Nix configuration is optional because `shell.nix` (explained later) included all of the things from this configuration.

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

- VSCodium with some a plugin for editing Nix files
- Git & GitHub CLI
# Nix Shell
The `shell.nix` is a configuration file for adding dependencies to your project. Once you have NixOS running you can activate it by opening the repository in terminal and running:

```
nix-shell
```
After that the system shoudld install all the dependencies defined in `shell.nix` temporarily for your terminal session. This includes VSCodium, that you should be able to open by running `codium .`.


# Installing Regolith

The `shell.nix` configuration installs Git and Go for you so you can download Regolith repository and build it yourself.

The GitHub repository: https://github.com/Bedrock-OSS/regolith

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
regolith
```
The `shell.nix` file adds the path where Go builds the executables to the PATH variable.

If for that doesn't work, you can try running it directly:
```text
~/go/bin/regolith
```

...or by adding the path yourself:
```text
export PATH="$HOME/go/bin:$PATH"
```
