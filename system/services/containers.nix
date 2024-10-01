{
  virtualisation = {
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
      dockerCompat = true;
      dockerSocket.enable = true;
    };
  };

  hardware.nvidia-container-toolkit.enable = true;

  networking.firewall.interfaces."podman+".allowedUDPPorts = [53];
}
