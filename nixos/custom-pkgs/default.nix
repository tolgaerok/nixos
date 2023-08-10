{ config, pkgs, ... }:

{

  imports = [

    #---------------------------------------------------------------------
    # Import custom in-house environment packages
    #---------------------------------------------------------------------

    ./mounter.nix
    ./unmounter.nix
    ./create-smb-user.nix

  ];

}