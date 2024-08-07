{inputs, ...}: {
  imports = [inputs.nvf.nixosModules.default];

  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = false;
      vimAlias = false;
      enableLuaLoader = true;
      preventJunkFiles = true;
      tabWidth = 4;
      autoIndent = true;
      cmdHeight = 1;
      useSystemClipboard = true;
      mouseSupport = "a";
      scrollOffset = 6;

      telescope.enable = true;

      autopairs.enable = true;

      notes = {
        todo-comments.enable = true;
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
      };

      autocomplete = {
        enable = true;
        alwaysComplete = false;
      };

      ui = {
        noice.enable = true;
      };

      visuals = {
        enable = true;
        indentBlankline = {
          enable = true;
          #          eolChar = null;
          #fillChar = null;
        };
        highlight-undo.enable = true;
      };

      notify = {
        nvim-notify.enable = true;
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
        lsplines.enable = true;
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
        enableLSP = true;
        enableTreesitter = true;
        bash.enable = true;
        clang = {
          enable = true;
          cHeader = true;
        };
        markdown.enable = true;
        nix = {
          enable = true;
        };
        rust = {
          enable = true;
          crates.enable = true;
        };
      };
    };
  };
}
