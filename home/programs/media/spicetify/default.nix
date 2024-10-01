{
  inputs,
  pkgs,
  config,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    variant = "mocha";
  in {
    enable = true;

    theme = spicePkgs.themes.catppuccin;

    colorScheme = variant;

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      history
      hidePodcasts
      shuffle
    ];
  };
}
