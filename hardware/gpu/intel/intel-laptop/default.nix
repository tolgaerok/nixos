{ ... }: {

  imports = [

    # Configuration for  intel gpu acceleration & tlp

    ./cpu-frequency
    ./intel-acceleration.nix
    ./laptop-packages
    ./tlp

  ];
}