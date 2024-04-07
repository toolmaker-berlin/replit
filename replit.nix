{ pkgs }: {
    deps = [
      pkgs.xorg.setxkbmap
      pkgs.nano
      pkgs.wget
      pkgs.fzf
      pkgs.cheat
      pkgs.du-dust
      pkgs.fd
      pkgs.tldr
      pkgs.atuin
      pkgs.exa
      pkgs.vifm-full
        pkgs.python310
        pkgs.bat
        pkgs.vimHugeX
        pkgs.julia-bin
    ];
}