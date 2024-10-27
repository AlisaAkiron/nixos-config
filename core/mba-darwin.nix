{ isDarwin, ... }:

let 
  myvalue = if isDarwin then "OK" else "NO";
in
{
  environment = {
    etc."zprofile".text = ''
      export MY_TEST_VAR="${myvalue}"
    '';
  };
}
