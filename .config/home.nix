
{ ... }:

{
    imports = [ <home-manager/nixos> ];

    users.users.kin = {
        isNormalUser = true;
        extraGroups = [
            "dialout"
            "docker"
            "networkmanager"
            "wheel"
        ];
    };

    home-manager.users.kin = { pkgs, ... }: {
        home.packages = with pkgs; [
            awesome
            picom
            feh
            st
            neovim

            stow
            tree
            git
        ];

        programs.zsh.enable = true;
        # Not complete
        programs.zsh.syntaxHighlighting.enable = true;

        home.file.".xinitrc".enable = true;
        home.file.".xinitrc".text = "exec awesome";

        home.stateVersion = "24.05";
    };
}
