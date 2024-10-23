{ lib, tags, ... }:

let
  hasTag = tag: tags: lib.elem tag tags;
in
{
  isNixOS = tags: hasTag "nixos" tags;
  isDarwin = tags: hasTag "darwin" tags;
  isWSL = tags: hasTag "wsl" tags;

  hasGnome = hasTag "gnome" tags;

  hasGraphic = tags: (hasTag "gnome" tags);

  hasHyprland = tags: (hasTag "hyprland" tags);
}
