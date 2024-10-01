{pkgs, ...}: {
  console = {
    earlySetup = true;
  };

  services.getty.autologinUser = "doomerang";
}
