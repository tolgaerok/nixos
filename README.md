# *`My NixOs 23.05 environment`*
```sh
Tolga Erok
14/6/2023
```
<div align="left">
  <table style="border-collapse: collapse; width: 100%; border: none;">
    <tr>
     <td align="center" style="border: none;">
        <a href="https://nixos.org/">
          <img src="https://flathub.org/img/distro/nixos.svg" alt="NixOS" style="width: 100%;">
          <br>NixOS
        </a>
      </td>     
    </tr>
  </table>
</div>

# *`Pre-production release !!`*
I've carefully curated a collection of essential packages that you can effortlessly install on your NixOS system using a single command: `sudo nixos-rebuild switch`. You'll find my selection of handpicked packages available right [here](https://github.com/tolgaerok/nixos/blob/41ad9b1ac3eeedf8de3cdeeb559acf3cb5913186/packages/ReadMe.md). All of them will be conveniently installed on your NixOS.

These carefully selected programs cover a wide range of categories, from:

-     archive utilities 
-     multimedia tools 
-     programming languages
-     office suites
-     system utilities
- And more [here](https://github.com/tolgaerok/nixos/blob/41ad9b1ac3eeedf8de3cdeeb559acf3cb5913186/packages/ReadMe.md)

By including these packages, I've aimed to enhance your NixOS experience and make your system feel more complete. Whether you're a developer, content creator, or everyday user, these additions offer a well-rounded toolkit that's ready for immediate use. Simply run the command, and enjoy the convenience and functionality that these packages bring to your NixOS environment.

![Screenshot_20230610_144645](https://github.com/tolgaerok/Linux-Tweaks-And-Scripts/assets/110285959/af6b682f-0ddd-45bc-babc-0584b0e70884)

## *`Enhancing User Experience through Kernel Optimization`*

In the pursuit of an even smoother computing journey, I've delved into the realm of kernel optimization. By fine-tuning how data flows from memory to disk, we can wield significant influence over the performance and responsiveness of our systems. These adjustments aren't just about technical tweaks; they're about crafting an environment that elevates our user experience.

Imagine having the ability to optimize memory usage, fine-tune disk writeback behavior, and even tailor network settings. These kernel tweaks transcend the mundane, offering a deeper level of control over the low-level aspects of our system's behavior. Through this journey of exploration and customization, we're not just configuring a machine; we're sculpting an environment that responds to our needs and aspirations.
```
{
  boot.kernel.sysctl = {
    "kernel.sysrq" = 1;                       # SysRQ for is rebooting their machine properly if it freezes: SOURCE: https://oglo.dev/tutorials/sysrq/index.html
    "net.core.rmem_default" = 16777216;       # Default socket receive buffer size, improve network performance & applications that use sockets
    "net.core.rmem_max" = 16777216;           # Maximum socket receive buffer size, determin the amount of data that can be buffered in memory for network operations
    "net.core.wmem_default" = 16777216;       # Default socket send buffer size, improve network performance & applications that use sockets
    "net.core.wmem_max" = 16777216;           # Maximum socket send buffer size, determin the amount of data that can be buffered in memory for network operations
    "net.ipv4.tcp_keepalive_intvl" = 30;      # TCP keepalive interval between probes, TCP keepalive probes, which are used to detect if a connection is still alive.
    "net.ipv4.tcp_keepalive_probes" = 5;      # TCP keepalive probes, TCP keepalive probes, which are used to detect if a connection is still alive.
    "net.ipv4.tcp_keepalive_time" = 300;      # TCP keepalive interval (seconds), TCP keepalive probes, which are used to detect if a connection is still alive.
    "vm.dirty_background_bytes" = 268435456;  # 256 MB in bytes, data that has been modified in memory and needs to be written to disk
    "vm.dirty_bytes" = 1073741824;            # 1 GB in bytes, data that has been modified in memory and needs to be written to disk
    "vm.min_free_kbytes" = 65536;             # Minimum free memory for safety (in KB), can help prevent memory exhaustion situations
    "vm.swappiness" = 1;                      # how aggressively the kernel swaps data from RAM to disk. Lower values prioritize keeping data in RAM,
    "vm.vfs_cache_pressure" = 50;             # Adjust vfs_cache_pressure (0-1000), how the kernel reclaims memory used for caching filesystem objects
  };
```
## Syncing User Home Folder to a Specified Destination

One of the key scripts I've developed is a custom synchronization script. This script allows me to effortlessly sync my user home folder to a specified destination. By running this script, I can ensure that all my important files and configurations are backed up and accessible from any location. This is particularly helpful when I switch machines or need to restore my settings after a fresh installation.

## Assisting with Mounting, Unmounting, and Suspending

To streamline my workflow, I've also developed a set of personal scripts that assist me with mounting, unmounting, and suspending operations. These scripts automate common tasks, saving me time and effort in managing external drives or suspending my system when I step away. By executing these scripts, I can perform these operations with just a single command, making my workflow more efficient.

## Custom NixOS Configuration File with Bluetooth Variables

As an enthusiast of NixOS, a powerful Linux distribution with a declarative approach to system configuration, I've created a custom configuration file tailored to my needs. In this file, I've set specific variables related to Bluetooth devices. By configuring these variables, I can easily manage my Bluetooth devices and ensure a seamless experience.




## Calling Common NixOS Commands with a Custom Script

To further simplify my interactions with NixOS, I've developed a custom script that encapsulates the most frequently used commands. With this script, I can quickly execute common tasks such as updating the system, installing packages, or configuring services. This saves me the hassle of remembering or typing out lengthy commands each time I need to perform these operations.

![1](https://github.com/tolgaerok/Linux-Tweaks-And-Scripts/assets/110285959/ae14cea8-dae9-4ea9-842d-7232e62ca9ff)

## Settings

### Hardware

Hardware | Enable | Description
:------------ | :---------- | :----------
`driSupport` | `true` | Enable accelerated OpenGL rendering through the Direct Rendering Interface (DRI).
`driSupport32Bit` | `true` | On 64-bit systems, whether to support Direct Rendering for 32-bit applications.
`plymouth` | `false` | Enable Plymouth boot splash screen.
`sane` | `false` | Enable support for SANE scanners.
`brscan4` | `false` | Automatically register the "brscan4" sane backend and bring configuration files to their expected location.

### Programs

Programs | Enable | Description
:------------ | :---------- | :----------
`adb` | `true` | Whether to configure system to use Android Debug Bridge (adb).
`command-not-found` | `true` | Whether interactive shells should show which Nix package (if any) provides a missing command.
`dconf` | `true` | Enable dconf.
`firefox` | `true` | Enable the Firefox web browser.
`fish` | `true` | Whether to configure fish as an interactive shell.
`git` | `true` | Enable git.
`gnupg.agent` | `true` | Enables GnuPG agent with socket-activation for every user session.
`java` | `true` | Install and setup the Java development kit.
`kdeconnect` | `true` | Enable kdeconnect.
`mtr` | `true` | Whether to add mtr to the global environment and configure a setcap wrapper for it.
`partition-manager` | `true` | Enable KDE Partition Manager.
`corectrl` | `false` | Enable A tool to overclock amd graphics cards and processors.
`htop` | `false` | Enable htop process monitor.
`steam` | `false` | Enable steam.

### Services

Service | Enable | Description
:------------ | :---------- | :----------
`fstrim` | `true` | Enable periodic SSD TRIM of mounted partitions in background.
`mysql` | `true` | Enable MySQL server (MariaDB).
`pipewire` | `true` | Enable pipewire service.
`postgresql` | `true` | Enable PostgreSQL Server.
`power-profiles-daemon` | `false` | DBus daemon that allows changing system behavior based upon user-selected power profiles.
`printing` | `true` | Enable printing support through the CUPS daemon.
`redis` | `true` | An open source, advanced key-value store.
`sddm` | `true` | Enable sddm as the display manager.
`udev` | `true` | Enable udev.
`udisks2` | `true` | DBus service that allows applications to query and manipulate storage devices.
`xserver` | `true` | Enable the X server.
`avahi` | `false` | Allows Avahi clients to use Avahi's service discovery facilities.
`mongodb` | `false` | Enable MongoDB Server.
`metabase` | `false` | Enable Metabase service.
`openssh` | `false` | OpenSSH secure shell daemon, which allows secure remote logins.
`thermald` | `false` | Enable thermald, the temperature management daemon.
`tlp` | `false` | Enable the TLP power management daemon.

### System

System | Enable | Description
:------------ | :---------- | :----------
`allowUnfree` | `true` | The configuration of the Nix Packages collection to allow unfree packages.
`auto-optimise-store` | `true` | Replaces files in the store that have identical contents with hard links to a single copy.
`bluetooth` | `true` | Enable support for Bluetooth.
`doas` | `true` | Enable the doas command, which allows non-root users to execute commands as root.
`firewall` | `false` | This is a simple stateful firewall that blocks connection attempts to unauthorised TCP or UDP ports on this machine.
`networkmanager` | `true` | Obtain an IP address and other configuration for all network interfaces that are not manually configured.
`nix.gc.automatic` | `true` | Automatically run the garbage collector at a specific time.
`nix.optimise` | `true` | Automatically run the nix store optimiser at a specific time.
`powerManagement` | `false` | Enable power management. This includes support for suspend-to-RAM and powersave features on laptops.
`rtkit` | `true` | Enable the RealtimeKit system service, which hands out realtime scheduling priority to user processes on demand.
`useTmpfs` | `true` | Whether to mount a tmpfs on /tmp during boot.
`zramSwap` | `true` | Enable in-memory compressed devices and swap space provided by the zram kernel module.
`allowReboot` | `false` | Reboot the system into the new generation instead of a switch.
`autoUpgrade` | `false` | Whether to periodically upgrade NixOS to the latest version.
`documentation.doc` | `false` | Whether to install documentation distributed in packages' /share/doc.
`documentation.info` | `false` | Whether to install info pages and the info command. This also includes "info" outputs.
`documentation.nixos` | `false` | Whether to install NixOS's own documentation.
`iwd` | `false` | Enable iwd.
`oomd` | `false` | Whether to disable the systemd-oomd OOM killer.
`pulseaudio` | `false` | Enable the PulseAudio sound server.
`useOSProber` | `true` | If set to true, append entries for other OSs detected by os-prober.
`xdg.portal.lxqt` | `false` | Enable the desktop portal for the LXQt desktop environment.
`xdg.portal.wlr` | `false` | Enable desktop portal for wlroots-based desktops.

### Virtualisation

Virtualisation | Enable | Description
:------------ | :---------- | :----------
`docker` | `false` | This option enables docker, a daemon that manages linux containers.

## Conclusion

In this blog post, I've highlighted some of the key components of my GitHub environment. From syncing my user home folder to developing scripts for mounting, unmounting, and suspending, to customizing my NixOS configuration file with Bluetooth variables and creating a script for common NixOS commands, these tools greatly enhance my productivity and simplify my workflow.

If you're interested in exploring these scripts or incorporating them into your own environment, feel free to check out my GitHub repository. I hope you find them useful and they inspire you to create your own custom solutions to enhance your development experience!

Happy coding! 😄

## *`How to run?`*

1. Make sure `git` is usable. If not, *add it into your environment.systemPackages in configuration.nix:*
   - Execute `sudo nixos-rebuild switch` in your terminal afterward.

```sh
Terminal: nix-shell -p git
Terminal: nix-shell -p git-extras
Terminal: nix-shell -p gitFull

or add into your configuration.nix file

# Nix package collection (pkgs) that you want to include in the system environment.
  environment.systemPackages = with pkgs; [    
    git
    git-extras
];

```

2. Open Terminal, type:

```sh
git clone https://github.com/tolgaerok/nixos.git
cd ./nixos
```

3. Copy either or all files into your /etc/nixos directory:
   - *configuration.nix*
   - *hardware-configuration.nix*  - Change to suit to you `UUID`
   - *bluetooth.service*
   - *smb-secrets*
    
Execute `sudo nixos-rebuild switch` in your terminal afterward.

```sh
sudo nixos-rebuild switch
```

## *Other repositories in my git hub:*

<div align="center">
  <table style="border-collapse: collapse; width: 100%; border: none;">
    <tr>
     <td align="center" style="border: none;">
        <a href="https://github.com/tolgaerok/fedora-tolga">
          <img src="https://flathub.org/img/distro/fedora.svg" alt="Fedora" style="width: 100%;">
          <br>Fedora
        </a>
      </td>
      <td align="center" style="border: none;">
        <a href="https://github.com/tolgaerok/Debian-tolga">
          <img src="https://flathub.org/img/distro/debian.svg" alt="Debian" style="width: 100%;">
          <br>Debian
        </a>
      </td>
    </tr>
  </table>
</div>

## *My Stats:*

<div align="center">

<div style="text-align: center;">
  <a href="https://git.io/streak-stats" target="_blank">
    <img src="http://github-readme-streak-stats.herokuapp.com?user=tolgaerok&theme=dark&background=000000" alt="GitHub Streak" style="display: block; margin: 0 auto;">
  </a>
  <div style="text-align: center;">
    <a href="https://github.com/anuraghazra/github-readme-stats" target="_blank">
      <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=tolgaerok&layout=compact&theme=vision-friendly-dark" alt="Top Languages" style="display: block; margin: 0 auto;">
    </a>
  </div>
</div>
</div>
</div>
</div>


