{inputs, ...}: {
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.sessionVariables = {
      VISUAL = "nvim";
      EDITOR = "nvim";
    };

    imports = [
      inputs.nvf.nixosModules.default
    ];

    programs.nvf = {
      enable = true;

      settings.vim = {
        vimAlias = true;

        extraPackages = with pkgs; [
          tree-sitter

          blade-formatter
          unocss-language-server
        ];

        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
          transparent = true;
        };

        spellcheck = {
          enable = true;
          programmingWordlist.enable = true;
        };

        opts = {
          shiftwidth = 4;
          tabstop = 4;
        };

        clipboard = {
          enable = true;
          registers = "unnamed,unnamedplus";
          providers.wl-copy.enable = true;
        };

        lineNumberMode = "number";
        statusline.lualine.enable = true;
        tabline.nvimBufferline.enable = true;
        syntaxHighlighting = true;
        autocomplete.nvim-cmp.enable = true;
        autopairs.nvim-autopairs.enable = true;
        comments.comment-nvim.enable = true;
        snippets.luasnip.enable = true;
        presence.neocord.enable = true;
        telescope.enable = true;

        filetree.neo-tree = {
          enable = true;
          setupOpts = {
            window.width = 26;

            filesystem = {
              use_libuv_file_watcher = true;

              follow_current_file = {
                enabled = true;
                leave_dirs_open = false;
              };
            };
          };
        };

        visuals = {
          nvim-scrollbar.enable = true;
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          blink-indent.enable = true;
          fidget-nvim.enable = true;
        };

        ui = {
          borders.enable = true;
          smartcolumn.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
          fastaction.enable = true;
          noice = {
            enable = true;
            setupOpts.views.cmdline_popup.position.row = -4;
          };
        };

        notes.todo-comments.enable = true;
        notify.nvim-notify = {
          enable = true;
          setupOpts.background_colour = "#000000";
        };

        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
        };

        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = false;
          neogit.enable = true;
        };

        utility = {
          direnv.enable = true;
          icon-picker.enable = true;
          mkdir.enable = true;
          multicursors.enable = true;
          preview.glow.enable = true;
          surround.enable = true;
        };

        filetype = {
          extension = {
            fsh = "glsl";
            vsh = "glsl";
          };
        };

        formatter.conform-nvim = {
          enable = true;
          setupOpts = {
            formatters_by_ft = {
              blade = ["blade-formatter"];
            };
          };
        };

        treesitter = {
          enable = true;
          indent.enable = true;

          grammars = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
            blade
          ];
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          lightbulb.enable = true;
          trouble.enable = true;
          otter-nvim.enable = true;

          servers = {
            unocss = {
              cmd = ["unocss-language-server" "--stdio"];
              filetypes = ["html" "blade"];
              root_markers = ["uno.config.js" "uno.config.ts" "unocss.config.js" "unocss.config.ts"];
            };
          };
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix = {
            enable = true;
            lsp.servers = ["nil" "nixd"];
          };

          bash.enable = true;

          env.enable = true;
          json.enable = true;
          toml.enable = true;
          yaml.enable = true;
          xml.enable = true;

          markdown.enable = true;

          clang.enable = true;
          python.enable = true;
          typescript.enable = true;

          glsl.enable = true;

          html.enable = true;
          css.enable = true;
          php = {
            enable = true;
            lsp.servers = ["intelephense"];
          };
        };
      };
    };

    xdg.mime = {
      defaultApplications = {
        "text/*" = "mvim.desktop";
        "text/markdown" = "mvim.desktop";
        "text/plain" = "mvim.desktop";
        "text/xml" = "mvim.desktop";
      };

      addedAssociations = {
        "text/*" = "mvim.desktop";
        "text/markdown" = "mvim.desktop";
        "text/plain" = "mvim.desktop";
        "text/xml" = "mvim.desktop";
      };
    };

    persistence.cache.dirs = [
      ".local/state/lazygit"
      ".local/state/nvf"
    ];
  };
}
