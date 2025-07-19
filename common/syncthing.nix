_: {
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    #configDir = "/home/felix/.config/syncthing";

    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "izolda" = {id = "MXIOLE6-2TI3YMA-7ZWL3X5-6E277K5-VAVJ73I-6PR63SQ-XUIMZOU-5LKYSAA";};
        "izaura" = { id = "V2DL6S3-ROGJMBA-ZMOMHCZ-VPARB35-OGB3PDY-LTSDSQ3-XWDWPAI-6Y3WMQL"; };
        # "klotylda" = { id = ""; };
        # "hiacynta" = { id = ""; };
      };

      folders = {
        "main" = {
          path = "/home/felix/Sync";
          devices = ["izolda"];
          versioning = {
            type = "simple";
            params = {
              keep = "5";
            };
          };
        };
        "osu-files" = {
          path = "/home/felix/.local/share/osu/files";
          devices = ["izolda"];
        };
        "osu-data" = {
          path = "/home/felix/.local/share/osu/client-realm";
          deviced = ["izolda"];
        };
        "projects" = {
          path = "/home/felix/prjcts";
          device = ["izolda"];
          versioning = {
            type = "simple";
            params = {
              keep = "5";
            };
          };
        };
        "studia" = {
          path = "/home/felix/studia";
          device = ["izolda"];
          versioning = {
            type = "simple";
            params = {
              keep = "5";
            };
          };
        };
        "hypr" = {
          path = "/home/.config/hypr";
          device = ["izolda"];
          versioning = {
            type = "simple";
            params = {
              keep = "5";
            };
          };
        };
        "btop" = {
            path = "/home/.config/themes";
            device = ["izolda"];
        };
        "librewolf" = {
          path = "/home/felix/.librewolf";
          device = ["izolda"];
        };
      };
    };
  };
}
