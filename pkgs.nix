{ pkgs, ... }: {
  packages = with pkgs; [
    git
    ripgrep
    neovim
    gh
    tmux
  ];
}
