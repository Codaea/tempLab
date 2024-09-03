# TEMP LAB

currently without a lab, and needed a temporary solution to get up and running.

done with nixos-anywhere 

TODO: 
- [ ] ADD SWAP TO DISK_CONFIG

steps to achive
1. load nixos onto machine
2. change password for root user
3. run `nixos-generate-config --no-filesystems --dir /mnt` to get hardware-configuration.nix
4. `nix flake lock`
5.  `nix run github:nix-community/nixos-anywhere -- --flake <path to configuration>#<configuration name> root@<ip address>`
