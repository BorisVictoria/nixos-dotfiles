{
  lib,
  config,
  pkgs,
  ...
}: {
  # Enable Nvidia drivers.
  boot.kernelParams = [
    "quiet"
    "nvidia_drm.fbdev=1"
    "clearcpuid=514"
    "vsyscall=emulate"
    "preempt=full"
  ];

  boot.blacklistedKernelModules = [
    "i2c_nvidia_gpu"
  ];

  boot.kernel.sysctl = {"kernel.split_lock_mitigate" = 0;};

  hardware.graphics = {enable = true;};

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };
}
