{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "emo-mruczek";
    userEmail = "krokcia1@gmail.com";
  };
}
