_ : let
  interface_private = "/home/felix/TP.txt";
  preshared = "/home/felix/PK.txt";
in {
  networking.wireguard = {
    enable = true;
    interfaces."wg0-tramwaj" = {
      ips = ["192.168.146.237/24"];

      privateKeyFile = interface_private;

      peers = [
        {
          name = "tramwaj";
          presharedKeyFile = preshared;
          publicKey = "EOI+qqf5B0fp7UVzxdVWCM7UmfydIt8WU7aXMTRlqSk=";

          allowedIPs = ["192.168.146.0/24"];
          endpoint = "156.17.229.121:5413";
        }
      ];
    };
  };
}
