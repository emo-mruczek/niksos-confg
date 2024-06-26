{
  config,
  pkgs,
  ...
}: {
  programs.wofi = {
    enable = true;
    settings = {
      location = "bottom-left";
      allow_markup = true;
      width = 250;
    };
    style = ''
              window {
        margin: 0px;
        border: 5px solid #111019;
        background-color: rgba(11, 10, 16, 0.9);
        border-radius: 15px;
      }

      #input {
        all: unset;
        min-height: 36px;
        padding: 4px 10px;
        margin: 4px;
        border: none;
        color: #e2e0ec;
        font-weight: bold;
        background-color: #161420;
        outline: none;
        border-radius: 15px;
        margin: 10px;
        margin-bottom: 2px;
      }

      #inner-box {
        margin: 4px;
        padding: 10px;
        font-weight: bold;
        border-radius: 15px;
      }

      #outer-box {
        margin: 0px;
        padding: 3px;
        border: none;
        border-radius: 15px;
        border: 5px solid #111019;
      }

      #scroll {
        margin-top: 5px;
        border: none;
        border-radius: 15px;
        margin-bottom: 5px;
      }

      #text:selected {
        color: #f1f0f5;
        margin: 0px 0px;
        border: none;
        border-radius: 15px;
      }

      #entry {
        margin: 0px 0px;
        border: none;
        border-radius: 15px;
        background-color: transparent;
      }

      #entry:selected {
        margin: 0px 0px;
        border: none;
        border-radius: 15px;
        background: linear-gradient(90deg, #E97193 0%, #74c7ec 100%);
      }
    '';
  };
}
