{ pkgs, lib, config, inputs, ... }:

{
	packages = [
		pkgs.gnumake
	];
	languages.texlive = {
		enable = true;
		packages = [  "enumitem" "titlesec" "scheme-small" "biblatex" "latexmk" ];
	};
	
	pre-commit.hooks = {
		latexindent.enable = true;
	};
}
