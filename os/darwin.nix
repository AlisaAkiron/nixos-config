let
  fn = import ../func;
in
[
  {
    moduleResolver =
      host:
      ../hosts/darwin
      + fn.match host [
        [
          "Alisa-MacBook-Pro"
          "/mbp"
        ]
      ];
    system = "aarch64-darwin";
    hosts = [
      "Alisa-MacBook-Pro" # Alisa MacBook Pro (M4 Pro, 2024)
    ];
  }
]
