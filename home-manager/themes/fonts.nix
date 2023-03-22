{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [ 
		nerdfonts
		#material-design-icons
		#iosevka
		#fira
		#fira-code-symbols
	];
  };
}
