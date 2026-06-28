{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/apps/factorio.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.fish.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;  
  };
  
  hardware.nvidia = {
    powerManagement.enable = false;
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  users.users.isaac = {
    isNormalUser = true;
    description = "isaac";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  programs.steam.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    vim
    bitwarden-desktop
    thorium-reader
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  system.stateVersion = "25.11";
}
