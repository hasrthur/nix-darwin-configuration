{ osConfig, ... }:

{
  programs.git = {
    enable = true;
    signing = {
      key = null;
      signByDefault = true;
    };
    settings = {
      user = {
        name = osConfig.fullName;
        email = osConfig.email;
      };
      alias = {
        branch = "branch -vv";
        ch = "checkout";
        st = "status";
        ls = "log --pretty=format:'%C(yellow)%h\ %ad%Cred%d\ %Creset%s%Cblue\ [%cn]' --decorate --date=short";
        ll = "log --pretty=format:'%C(yellow)%h%Cred%d\ %Creset%s%Cblue\ [%cn]' --decorate --numstat --date=short";
        old = "branch -r --sort=committerdate --format='[%(color:green)%(committerdate:relative)%(color:reset)] (%(authorname)) %(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject)'";
      };
      core = {
        autocrlf = "input";
      };
      push = {
        default = "current";
      };
      pull = {
        rebase = true;
      };
      rerere = {
        enabled = true;
      };
      init = {
        defaultBranch = "main";
      };
      color = {
        ui = "auto";
      };
    };
    ignores = [
      "/vendor/bundle"
      "vendor/bundle"
      "/.idea"
      "/.DS_Store"
    ];
    includes = [
      {
        condition = "gitdir/i:~/Projects/Gatekeeper/";
        path = "~/Projects/Gatekeeper/.gitconfig";
      }
    ];
  };

  programs = {
    diff-so-fancy.enable = true;
    diff-so-fancy.enableGitIntegration = true;
  };
}
