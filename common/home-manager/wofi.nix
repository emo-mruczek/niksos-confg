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
      width = 350;
    };
    style = ''
      window {
          margin: 0px;
          background-color: #232136;
          border-radius: 10px;
          border: 2px solid #eb6f92;
          color: #e0def4;
          font-family: 'Monofur Nerd Font';
          font-size: 20px;
      }

      #input {
          margin: 5px;
          border-radius: 10px;
          border: none;
          border-radius: 10px;
          color: #eb6f92;
          background-color: #393552;
      }

      #inner-box {
          margin: 5px;
          border: none;
          background-color: #393552;
          color: #232136;
          border-radius: 10px;
      }

      #outer-box {
          margin: 15px;
          border: none;
          border-radius: 10px;
          background-color: #232136;
      }

      #scroll {
          margin: 0px;
          border: none;
      }

      #text {
          margin: 5px;
          border: none;
          color: #e0def4;
      }

      #entry:selected {
          background-color: #eb6f92;
          color: #232136;
          border-radius: 10px;;
          outline: none;
      }

      #entry:selected * {
          background-color: #eb6f92;
          color: #232136;
          border-radius: 10px;;
          outline: none;
      }
    '';
  };
}
