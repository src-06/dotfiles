{
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      nmap
      burpsuite
      wireshark
      john
      metasploit
    ];
  };
}
