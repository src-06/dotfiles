{
  flake.nixosModules.general = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      bat
      eza
      rip2
      rsync
      yt-dlp
    ];

    programs = {
      fish = {
        enable = true;

        interactiveShellInit = ''
          set fish_greeting

          #rip completions fish | source

          #fish_add_path ~/.local/bin
          #fish_add_path ~/.cargo/bin
          #fish_add_path ~/.config/composer/vendor/bin
        '';

        shellAliases = {
          clear = "printf '\\033[2J\\033[3J\\033[1;1H'";
          claer = "printf '\\033[2J\\033[3J\\033[1;1H'";

          diff = "diff --color=auto";
          grep = "grep --color=auto";

          ls = "eza -ah --icons --group-directories-first";
          ll = "eza -lah --icons --group-directories-first";
          tree = "eza --tree --icons --group-directories-first";

          rs = "rsync -av --human-readable";
          rsd = "rsync -av --delete --human-readable";
          rst = "rsync -av --delete --dry-run --human-readable";

          yt-dlm = "yt-dlp -x --audio-format opus --audio-quality 0 --embed-metadata --embed-thumbnail --download-archive .ytm --no-overwrites -o '%(uploader)s - %(title)s.%(ext)s'";
          yt-dlv = "yt-dlp -f 'bv*[height<=720][ext=mp4]+ba*' --embed-metadata -o '%(uploader)s - %(title)s.%(ext)s'";
        };
      };

      starship = {
        enable = true;

        settings = {
          add_newline = false;

          format = ''
            ╭─────────▶$os$hostname$username $nix_shell$conda $time $shell
            │$directory $git_branch$git_status $nodejs$php$python
            ╰$character'';

          ################################################################################

          os = {
            disabled = false;

            symbols = {
              Arch = " ";
              Debian = " ";
              Fedora = " ";
              NixOS = " ";
              openSUSE = " ";
              Linux = " ";
              Windows = " ";
            };
          };

          hostname = {
            format = "[ $ssh_symbol$hostname]($style)";
            ssh_only = false;
          };

          username = {
            show_always = true;
            format = "[ 󰀄 $user]($style)";
          };

          ################################################################################

          nix_shell = {
            symbol = "";
            format = "[ $symbol$state( \($name\))]($style)";
          };

          conda = {
            format = "[ $symbol( $environment)]($style)";
          };

          ################################################################################

          time = {
            disabled = false;
            time_format = "%R";
            format = "[ $time]($style)";
          };

          shell = {
            disabled = false;
            format = "[  $indicator]($style)";
            bash_indicator = "bash";
            fish_indicator = "fish";
          };

          ################################################################################
          ################################################################################

          directory = {
            format = "[  $path]($style)";
            truncation_length = 2;
            truncation_symbol = "…/";
            substitutions = {
              "Libraries" = "";
              "Documents" = "󰈙";
              "Downloads" = "";
              "Music" = "󰝚";
              "Photos" = "";
              "Projects" = "󰲋";
              "Videos" = "";
            };
          };

          ################################################################################

          git_branch = {
            symbol = " ";
            format = "[ $symbol$branch]($style)";
          };

          git_status = {
            format = "[ ($all_status$ahead_behind)]($style)";
          };

          ################################################################################

          nodejs = {
            symbol = "";
            format = "[ $symbol( $version)]($style)";
          };

          php = {
            symbol = "";
            format = "[ $symbol( $version)]($style)";
          };

          python = {
            symbol = "";
            format = "[ $symbol( $version)]($style)";
          };

          ################################################################################
          ################################################################################

          character = {
            success_symbol = "[❱ ](bold green)";
            error_symbol = "[❱ ](bold red)";
            format = "$symbol";
          };
        };

        presets = [
          "nerd-font-symbols"
        ];
      };
    };

    # Find and Change Directory
    hjem.config.files."fish/functions/fcd.fish".text = ''
      function fcd
        set -l dir (fd -t d . $argv[1] | fzf)
        test -n "$dir"; and cd "$dir"
      end
    '';

    # Save for bash/zsh later...
    #fcd() {
    #  local dir
    #  dir=$(fd -t d . "${1:-.}" | fzf) && [ -n "$dir" ] && cd "$dir"
    #}

    persistence.cache.dirs = [
      ".local/share/fish"
    ];
  };
}
