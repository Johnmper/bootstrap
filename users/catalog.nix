{ hosts }:
{
  johnmper = {
    username = "johnmper";
    home = ./johnmper/home.nix;
  };
  johndoe = {
    username = "johndoe";
    home = ./johndoe/home.nix;
  };
}
