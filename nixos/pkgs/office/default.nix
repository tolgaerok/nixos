{ pkgs, ... }:
{
  # Office and Productivity:
  environment = {
    systemPackages = with pkgs; [
      wpsoffice     
    ];
  };
}
