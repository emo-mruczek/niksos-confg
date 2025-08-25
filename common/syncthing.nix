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
        "izolda" = {id = "34TTSGY-FQIRSXF-ZR5WGEW-RWOYUAA-UZ5B4DB-BGFJFW4-O7FR3VY-KAXJJQ7";};
        "izaura" = {id = "FDM4WPF-24HPMQB-NY7VM6S-LW3WDLT-NBBN2RO-AXGEKQA-KPOC3YZ-LXDH5Q4";};
        "klotylda" = { id = "73Q6VDW-AI36X4E-V54FPCZ-WDIHZ3J-JW6JLZK-B5WUBT5-WWWUYPU-3QL6HQ3"; };
        # "hiacynta" = { id = ""; };
      };

      folders = {
        "main" = {
          path = "/home/felix/Sync";
          devices = ["izolda" "izaura" "klotylda"];
          versioning = {
            type = "simple";
            params = {
              keep = "5";
            };
          };
        };
        "osu-files" = {
          path = "/home/felix/.local/share/osu";
          devices = ["izolda" "izaura"];
        };
        "projects" = {
          path = "/home/felix/prjcts";
          devices = ["izolda" "izaura"];
          versioning = {
            type = "simple";
            params = {
              keep = "5";
            };
          };
        };
        "studia" = {
          path = "/home/felix/studia";
          devices = ["izolda" "izaura"];
          versioning = {
            type = "simple";
            params = {
              keep = "5";
            };
          };
        };
        "hypr" = {
          path = "/home/felix/.config/hypr";
          devices = ["izolda" "izaura"];
          versioning = {
            type = "simple";
            params = {
              keep = "5";
            };
          };
        };
        "btop" = {
            path = "/home/felix/.config/btop/themes";
            devices = ["izolda" "izaura"];
        };
        # "librewolf" = {
        #   path = "/home/felix/.librewolf";
        #   devices = ["izolda" "izaura"];
        # };
      };
    };
  };
}
