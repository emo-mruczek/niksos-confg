{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nvf.nixosModules.default];

  programs.nvf = {
    enable = true;

    settings.vim = {
      package = pkgs.neovim-unwrapped;

      extraPlugins = {
        vimtex.package = pkgs.vimPlugins.vimtex;
        markview.package = pkgs.vimPlugins.markview-nvim;
      };

      clipboard.registers = "unnamedplus";

      options = {
        # not sure of the numbers
        tabstop = 8;
        shiftwidth = 4;
        cmdheight = 1;
        mouse = "a";
        autoindent = true;
        scrolloff = 6;
      };

      viAlias = false;
      vimAlias = false;
      enableLuaLoader = true;
      preventJunkFiles = true;
      #tabWidth = 4;

      # useSystemClipboard = true;

      telescope.enable = true;

      #autopairs.enable = true;
      autopairs.nvim-autopairs.enable = true;

      notes = {
        todo-comments = {
          enable = true;
          setupOpts.highlight.pattern = ".*<(KEYWORDS)\s*";
        };
      };

      utility = {
        surround.enable = true;
      };

      theme = {
        enable = true;
        transparent = true;
        name = "rose-pine";
        style = "moon";
      };

      maps = {
        normal = {
          "<leader>v" = {
            action = "<CMD>Neotree toggle<CR>";
            silent = true;
          };
          "<leader>m" = {
            action = "<CMD>MarkdownPreviewToggle<CR>";
            silent = true;
          };
        };

        terminal = {
          # get out of terminal mode in toggleterm
          "<ESC>" = {
            action = "<C-\\><C-n>";
            silent = true;
          };
        };
      };

      filetree.neo-tree = {
        enable = true;
      };

      statusline.lualine = {
        enable = true;
        theme = "auto";
      };

      treesitter = {
        enable = true;
        fold = true;
        context.enable = true;
        highlight.enable = true;
        indent.enable = true;
        addDefaultGrammars = true;
      };

      autocomplete = {
        # enable = true;
        #  alwaysComplete = false;
        nvim-cmp.enable = true;
      };

      ui = {
        noice.enable = true;
      };

      visuals = {
        #   enable = true;
        indent-blankline = {
          enable = true;
          #          eolChar = null;
          #fillChar = null;
        };
        highlight-undo.enable = true;
      };

      notify = {
        nvim-notify.enable = true;
        nvim-notify.setupOpts.background_colour = "#000000"; # because somethings broken
      };

      terminal.toggleterm = {
        enable = true;
        setupOpts.direction = "tab";
        mappings.open = "<C-\\>";
      };

      git = {
        enable = true;
        gitsigns = {
          enable = true;
        };
      };

      lsp = {
        enable = true;
        lspSignature.enable = true;
        lspconfig.enable = true;
        # lsplines.enable = true;
        mappings = {
          addWorkspaceFolder = "<leader>wa";
          codeAction = "<leader>a";
          format = "<C-f>";
          goToDeclaration = "gD";
          goToDefinition = "gd";
          hover = "K";
          listImplementations = "gi";
          listReferences = "gr";
          listWorkspaceFolders = "<leader>wl";
          nextDiagnostic = "<leader>k";
          previousDiagnostic = "<leader>j";
          openDiagnosticFloat = "<leader>e";
          removeWorkspaceFolder = "<leader>wr";
          renameSymbol = "<leader>r";
          signatureHelp = "<C-k>";
        };
      };

      languages = {
        enableDAP = true;
        enableExtraDiagnostics = true;
        enableFormat = true;
        enableTreesitter = true;
        bash.enable = true;
        clang = {
          enable = true;
          cHeader = true;
        };
        # markdown.enable = true;
        nix = {
          enable = true;
        };
        rust = {
          enable = true;
          crates.enable = true;
        };
        html = {
          enable = true;
        };
        haskell.enable = true;
        go.enable = true;
      };
    };
  };
}
