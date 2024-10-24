{ ... }:

{
  programs.waybar.settings.mainBar = {
    layer = "top";
    position = "top";
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;

    # Module Position
    modules-left = [ ];
    modules-center = [ ];
    modules-right = [
      "clock"
    ];

    # Modules

    ## Clock
    clock = {
      format = "{:%H:%M %a}";
      on-click = "ags -t calendar";
      tooltip = false;
    };
  };
}
