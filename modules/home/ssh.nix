{ ... }:

let
  onePasswordPath = "~/.1password/agent.sock";
in
{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
        IdentityAgent ${onePasswordPath}
    '';
  };
}
