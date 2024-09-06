#kernel
{ config, pkgs, inputs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
}


