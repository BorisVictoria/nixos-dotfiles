{ pkgs, ... }: {
  home.packages = with pkgs; [
    # archives
    unar

    # misc
    libnotify
    trashy

    # utils
    ffmpeg
    parted

    # yazi
    du-dust
    fd
    file
    ffmpegthumbnailer
    jaq
    poppler

    # essentials
    neo-cowsay
    fortune-kind
  ];

  programs = { eza.enable = true; };
}
