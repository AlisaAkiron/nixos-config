{ pkgs, ... }:

let 
  op-agent-sock = if pkgs.stdenvNoCC.isDarwin
    then "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    else "~/.1password/agent.sock";
in
{
  programs.ssh = {
    extraConfig = ''
      Host *
	      IdentityAgent "${op-agent-sock}"
    '';
  };
}
