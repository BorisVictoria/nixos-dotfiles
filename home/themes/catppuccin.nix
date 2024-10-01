{
  pkgs,
  config,
  ...
}: {
  catppuccin = {
    enable = true;
    accent = "rosewater";
    flavor = "mocha";

    pointerCursor = {
      enable = true;
      accent = "rosewater";
      flavor = "mocha";
    };
  };

  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      accent = "rosewater";
      flavor = "mocha";
      size = "standard";
      tweaks = [
        "black"
      ];
      icon = {
        enable = true;
        accent = "rosewater";
        flavor = "mocha";
      };
    };
  };

  qt = {
    enable = true;
    platformTheme = {
      name = "kvantum";
    };
    style = {
      name = "kvantum";
      catppuccin = {
        enable = true;
        accent = "rosewater";
        flavor = "mocha";
      };
    };
  };
}
