_: {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    configDir = "/home/felix/.config/syncthing";

    user = "felix";
    group = "users";

    overrideDevices = false;
    overrideFolders = false;
    settings = {
      devices = {
        "izolda" = {id = "MXIOLE6-2TI3YMA-7ZWL3X5-6E277K5-VAVJ73I-6PR63SQ-XUIMZOU-5LKYSAA";};
        "izaura" = { id = "FDM4WPF-24HPMQB-NY7VM6S-LW3WDLT-NBBN2RO-AXGEKQA-KPOC3YZ-LXDH5Q4"; };
        # "klotylda" = { id = ""; };
        # "hiacynta" = { id = ""; };
      };

      folders = {
        "main" = {
          path = "/home/felix/Sync";
          devices = ["izolda" "izaura"];
          versioning = {
            type = "simple";
            params = {
              keep = "5";
            };
          };
        };
        "osu-files" = {
          path = "/home/felix/.local/share/osu/files";
          devices = ["izolda" "izaura"];
        };
        "osu-data" = {
          path = "/home/felix/.local/share/osu/client-realm";
          deviced = ["izolda" "izaura"];
        };
        "projects" = {
          path = "/home/felix/prjcts";
          device = ["izolda" "izaura"];
          versioning = {
            type = "simple";
            params = {
              keep = "5";
            };
          };
        };
        "studia" = {
          path = "/home/felix/studia";
          device = ["izolda" "izaura"];
          versioning = {
            type = "simple";
            params = {
              keep = "5";
            };
          };
        };
        "hypr" = {
          path = "/home/felix/.config/hypr";
          device = ["izolda" "izaura"];
          versioning = {
            type = "simple";
            params = {
              keep = "5";
            };
          };
        };
        "btop" = {
            path = "/home/felix/.config/btop/themes";
            device = ["izolda" "izaura"];
        };
        "librewolf" = {
          path = "/home/felix/.librewolf";
          device = ["izolda" "izaura"];
        };
      };
    };
  };
}
