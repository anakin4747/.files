
{ ... }:

{
    imports = [ <home-manager/nixos> ];

    users.user.kin = {
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
            neovim
            stow
            st
            awesome
            tree
            git
        ];

        programs.zsh.enable = true;
        # Not complete
        programs.zsh.syntaxHighlighting.enable = true;

        home.stateVersion = "24.05";
    };
}
