{ lib, ... }:

{
  options = {
    username = lib.mkOption {
      type = lib.types.str;
      default = false;
      description = "System username";
    };

    fullName = lib.mkOption {
      type = lib.types.str;
      default = false;
      description = "User full name. Used e.g. in git configuration";
    };

    email = lib.mkOption {
      type = lib.types.str;
      default = false;
      description = "User email";
    };

    flake = lib.mkOption {
      type = lib.types.str;
      default = false;
      description = "Flake location in file system";
    };
  };
}
