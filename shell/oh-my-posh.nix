{ ... }:

{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      async = true;
      console_title_template = "{{ .Folder }}";
      final_space = true;
      version = 3;
      blocks = [
        {
          alignment = "left";
          newline = true;
          type = "prompt";
          segments = [
            {
              background = "transparent";
              foreground = "blue";
              style = "plain";
              template = "{{ .Path }}";
              type = "path";
              properties = {
                style = "full";
              };
            }
            {
              background = "transparent";
              foreground = "#5FD7FF";
              style = "plain";
              template = " {{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }}  {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }}  {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }}  {{ .StashCount }}{{ end }}";
              type = "git";
              properties = {
                fetch_upstream_icon = true;
                fetch_status = true;
              };
            }
            {
              type = "ruby";
              foreground = "red";
              template = "  {{ .Full }}";
            }
            {
              background = "transparent";
              foreground = "yellow";
              style = "plain";
              template = " {{ .FormattedMs }}";
              type = "executiontime";
            }
          ];
        }
        {
          alignment = "left";
          newline = true;
          type = "prompt";
          segments = [
            {
              background = "transparent";
              foreground_templates = [
                "{{if gt .Code 0}}red{{end}}"
                "{{if eq .Code 0}}magenta{{end}}"
              ];
              style = "plain";
              template = "❯";
              type = "text";
            }
          ];
        }
      ];
      secondary_prompt = {
        background = "transparent";
        foreground = "magenta";
        template = "❯❯ ";
      };
      transient_prompt = {
        background = "transparent";
        foreground_templates = [
          "{{if gt .Code 0}}red{{end}}"
          "{{if eq .Code 0}}magenta{{end}}"
        ];
        template = "❯ ";
      };
    };
  };
}