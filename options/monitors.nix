{lib,  ...}: 
let
  
  inherit (lib.options) mkOption;
  inherit (lib.types) attrsOf float submodule;
  inherit (lib.types.ints) positive;

in {
  options.monitors = mkOption {
    description = "monitor spec";

    type = attrsOf (submodule {
      options = {

        resolution = mkOption {
          description = "monitor resolution";
          type = submodule {
            options = {
                width = mkOption {
                  description = "monitor width";
                  type = positive;
                };
                height = mkOption {
                  description = "monitor height";
                  type = positive;
                };
            };
          };
        };

        refreshRate = mkOption {
          description = "monitor refresh rate";
          type = float;
        };

        scale = mkOption {
          description = "monitor scale";
          type = float;
        };
      };
    });
  };
}
