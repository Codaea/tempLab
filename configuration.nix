{ modulesPath, config, lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
  ];
  
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "homelab";
  networking.networkmanager.enable = true;

  # Enable Flakes
  nix.settings.experimental-features = ["flakes" "nix-command"];

  time.timeZone = "America/Los_Angeles";

  users.users.coda = {
    isNormalUser = true;
    extraGroups = [ "network manager" "wheel" ];
    packages = with pkgs; [
      go 
      nodejs_22
    ];
    hashedPassword = "$y$j9T$aD6CgpJzBJjWWgb4dD0AU1$zbx2UIAANWe7PdqBq8WYiJKPncKxoU/VLfzDPqVioo1";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwvYOO4uYI2nKx7H4fBD1cg1ERoJyBSRCupS6ijTQ+zE67o9IvSyl7+sWmGOlqDG5536c7aCoOjmWOwNxOFhUiccnUSm/Q2+ydy/OwL49mkNCVVyyeM09DyoHCIQzNLQ7U2Gr2qKcL/3jqsPAjmb7HLsl+kPeI2W4D/hagre8vHFqxlCPZO1zFGGkoXFLk1QXL9xj4K5P/iHXoW61DNHajjfHu5qU2vhNZyt1+WLNPb6eJE3xyqSISOjWhuBuwsNohxQ3nPw06A5J59q+neCzcZMn7fGsGOALAz4NmC5Q/lz/gVJn8z0Y9kWr7x/mePL8bYt0Kitb3iVvnFvFJGDBakQI/xBhQobQY9rg11a/lCImerfZUfJAITHIe1Dh305zqPAzvCsMcCcJobxUXxzwzNy/4ea1NHS/vFdyNL3ctp6RxLzHKiU/mqRQyx5ueDzlSV7oI5HJHCMUACQUacY41IZ0GhbAls0pKne5p258K4HT+Zhd8vfLp2qCZKsPqvSU= coda@agave"
    ];
  };


  services.openssh.enable = true;

  services.vscode-server.enable = true;

  # does some funky stuff, remove if problems later
  services.vscode-server.enableFHS = true;


  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [
    git
    curl
  ];

  system.stateVersion = "24.05";
}