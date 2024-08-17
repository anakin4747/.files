# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ pkgs, ... }:

{
    imports = [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        /home/kin/.config/home.nix
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot.loader.systemd-boot.enable = true;

    networking.hostName = "KIN";
    networking.networkmanager.enable = true;

    time.timeZone = "Canada/Eastern";
    i18n.defaultLocale = "en_CA.UTF-8";

    # Enable X11
    services.xserver = {
        enable = true;

        xkb = {
            layout = "us";
            options = "caps:escape";
        };

        # Pull in everything needed for Gnome Desktop Environment
        desktopManager.gnome.enable = true;

        # Login with virtual tty
        autorun = false;
        exportConfiguration = true;
        desktopManager.startx.enable = true;
    };

    services.printing.enable = true;

    # Enable sound.
    hardware.pulseaudio.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
    services.libinput.enable = true;

    environment.systemPackages = with pkgs; [
        neovim
        vim

        # awesome

        # gnome.gnome-shell
        # gnome.gnome-terminal
        # brave
        # mattermost-desktop
        # tio
        # unzip
        # wget
        # zip

        # Neovim packages
        # neovim
        # nil
        # clang-tools
        # cmake-language-server
        # vim-language-server
        # lua-language-server
        # nodePackages.bash-language-server
        # pyright
        # ripgrep
    ];

    virtualisation.docker.enable = true;

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # Copy the NixOS configuration file and link it from the resulting system
    # (/run/current-system/configuration.nix). This is useful in case you
    # accidentally delete configuration.nix.
    # system.copySystemConfiguration = true;

    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    #
    # Most users should NEVER change this value after the initial install, for any reason,
    # even if you've upgraded your system to a new NixOS release.
    #
    # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
    # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
    # to actually do that.
    #
    # This value being lower than the current NixOS release does NOT mean your system is
    # out of date, out of support, or vulnerable.
    #
    # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
    # and migrated your data accordingly.
    #
    # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    system.stateVersion = "24.05"; # Did you read the comment?

}

