{inputs, ...}: {
  flake.nixosModules.apps = {pkgs, ...}: {
    imports = [
      inputs.nvf.nixosModules.default
    ];

    programs = {
      nvf = {
        enable = true;

        settings.vim = {
          vimAlias = true;

          extraPackages = with pkgs; [
            tree-sitter
          ];

          theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";
            transparent = true;
          };

          statusline.lualine = {
            enable = true;
            theme = "gruvbox";
          };

          clipboard = {
            enable = true;
            providers.wl-copy.enable = true;
          };

          spellcheck = {
            enable = true;
            programmingWordlist.enable = true;
          };

          opts = {
            shiftwidth = 4;
            tabstop = 4;
          };

          lineNumberMode = "number";
          tabline.nvimBufferline.enable = true;
          syntaxHighlighting = true;
          autocomplete.nvim-cmp.enable = true;
          autopairs.nvim-autopairs.enable = true;
          snippets.luasnip.enable = true;
          presence.neocord.enable = true;
          telescope.enable = true;

          filetree.neo-tree = {
            enable = true;
            setupOpts = {
              window = {
                position = "right";
                width = 30;
              };

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
            noice.enable = true;
            fastaction.enable = true;
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
            surround.enable = true;
          };

          treesitter = {
            enable = true;
            indent.enable = true;
          };

          lsp = {
            enable = true;
            formatOnSave = true;
            lightbulb.enable = true;
            lspSignature.enable = true;
            trouble.enable = true;
            otter-nvim.enable = true;
          };

          languages = {
            enableFormat = true;
            enableTreesitter = true;
            enableExtraDiagnostics = true;

            nix = {
              enable = true;

              lsp = {
                enable = true;
                servers = ["nil" "nixd"];
              };
            };

            bash.enable = true;

            env.enable = true;
            json.enable = true;
            toml.enable = true;
            yaml.enable = true;

            cmake.enable = true;
            just.enable = true;

            clang.enable = true;
            qml.enable = true;
            typescript.enable = true;

            css.enable = true;
            html.enable = true;
            svelte.enable = true;
            tsx.enable = true;
            vue.enable = true;
          };
        };
      };
    };
  };
}
