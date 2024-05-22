{pkgs, ...}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      # Background color
      color = "232136";

      clock = true;
      image = "~/niksos-confg/bigcat.jpg";

      indicator-x-position = "2075";

      # Layout text colors
      layout-bg-color = "#00000000";
      layout-border-color = "#00000000";
      layout-text-color = "#e0def4";

      # Text color
      text-color = "#3e8fb0";
      text-clear-color = "#9ccfd8";
      text-caps-lock-color = "#f6c177";
      text-ver-color = "#c4a7e7";
      text-wrong-color = "#eb6f92";

      # Highlight segments
      bs-hl-color = "#23213666";
      key-hl-color = "#3e8fb0";
      caps-lock-bs-hl-color = "#23213666";
      caps-lock-key-hl-color = "#f6c177";

      # Highlight segments separator
      separator-color = "#00000000";

      # Inside of the indicator
      inside-color = "#3e8fb055";
      inside-clear-color = "#9ccfd855";
      inside-caps-lock-color = "#f6c17755";
      inside-ver-color = "#c4a7e755";
      inside-wrong-color = "#eb6f9255";

      # Line between the inside and ring
      line-color = "#3e8fb011";
      line-clear-color = "#9ccfd811";
      line-caps-lock-color = "#f6c17711";
      line-ver-color = "#c4a7e711";
      line-wrong-color = "#eb6f9211";

      # Indicator ring
      ring-color = "#3e8fb0aa";
      ring-clear-color = "#9ccfd8aa";
      ring-caps-lock-color = "#f6c177aa";
      ring-ver-color = "#c4a7e7aa";
      ring-wrong-color = "#eb6f92aa";
    };
  };
}
