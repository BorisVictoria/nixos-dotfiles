{inputs, ...}: {
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        softrealtime = "auto";
        renice = 15;
      };
      gpu = {
        apply_gpu_optimizations = "accept-responsibility";
        nv_powermizer_mode = 1;
        nv_core_clock_mhz_offset = 120;
        nv_mem_clock_mhz_offset = 900;
      };
    };
  };
}
