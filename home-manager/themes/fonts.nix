{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [ 
	material-design-icons
	iosevka
	fira
	fira-code-symbols
	];
  };
}
