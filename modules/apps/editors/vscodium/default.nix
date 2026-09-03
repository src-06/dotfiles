{
  flake.nixosModules.apps = {
    pkgs,
    config,
    ...
  }: let
    inherit (config.preferences.theme) id name colors;
    user = config.preferences.user.name;
  in {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium-fhs;
      # If in repo NixOS have extension in list use from `vscode-extensions` if not found uses from source vscode marketplace `vscode-marketplace` (nix-community/nix-vscode-extensions)
      extensions = with pkgs.vscode-extensions;
      with pkgs.vscode-marketplace; [
        (pkgs.callPackage ./_theme.nix {} colors user name id)

        yusifaliyevpro.vscicons
        pkief.material-product-icons

        oderwat.indent-rainbow
        naumovs.color-highlight

        shardulm94.trailing-spaces
        usernamehw.errorlens
        kisstkondoros.vscode-gutter-preview
        christian-kohler.path-intellisense
        mitchdenny.ecdc

        mikestead.dotenv
        editorconfig.editorconfig
        redhat.vscode-yaml
        tamasfe.even-better-toml

        esbenp.prettier-vscode
        dbaeumer.vscode-eslint

        antfu.unocss
        antfu.iconify
        zignd.html-css-class-completion

        formulahendry.auto-close-tag
        anteprimorac.html-end-tag-labels
        bradgashler.htmltagwrap

        yzhang.markdown-all-in-one
        zaaack.markdown-editor

        budparr.language-hugo-vscode
        svelte.svelte-vscode
        vue.volar
      ];
    };

    xdg.mime.removedAssociations = {
      "text/plain" = "codium.desktop";
      "inode/directory" = "codium.desktop";
    };

    hjem.config.files = {
      "VSCodium/User/settings.json".text = builtins.toJSON {
        "workbench.colorTheme" = name;
        "workbench.iconTheme" = "icons";
        "workbench.productIconTheme" = "material-product-icons";
        "workbench.tree.enableStickyScroll" = false;
        "workbench.startupEditor" = "none";
        "editor.fontFamily" = "'CaskaydiaMono Nerd Font Mono', monospace";
        "editor.tabSize" = 2;
        "editor.linkedEditing" = true;
        "editor.stickyScroll.enabled" = false;
        "terminal.integrated.stickyScroll.enabled" = false;
        "security.workspace.trust.enabled" = false;
        "extensions.autoUpdate" = "off";
        "js/ts.suggest.paths" = false;
      };

      "VSCodium/User/keybindings.json".text = builtins.toJSON [
        {
          key = "ctrl+n";
          command = "-workbench.action.files.newUntitledFile";
        }
        {
          key = "ctrl+shift+n";
          command = "-workbench.action.newWindow";
        }
        {
          key = "ctrl+n";
          command = "explorer.newFile";
        }
        {
          key = "ctrl+shift+n";
          command = "explorer.newFolder";
        }
      ];
    };
  };
}
