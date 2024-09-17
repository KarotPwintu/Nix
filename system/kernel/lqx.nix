#kernel
{ config, pkgs, inputs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_lqx;
}