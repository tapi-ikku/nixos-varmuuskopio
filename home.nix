{ config, pkgs, ... }:

{
	home.username = "tapsa";
	home.homeDirectory = "/home/tapsa";

	# Home Manager -versio
	home.stateVersion = "26.05";
	home.enableNixpkgsReleaseCheck = false;

	# Tänne voit myöhemmin lisätä käyttäjäkohtaisia paketteja
	home.packages = with pkgs; [
		htop
		git
		wget
		curl
		fastfetch
		spotify
		vlc
	];

	# Salli Home Managerin hallinnoida itseään
	programs.home-manager.enable = true;
	home.backupFileExtension = "backup";

	programs.bash = {
		enable = true;
		shellAliases = {
			ll = "ls-l";
			siivoa = "nix-collect-garbage -d";
			paivita = "sudo nix flake update --flake /home/tapsa/:dotfiles && sudo nixos-rebuild switch --flake /home/tapsa/:dotfiles#nixos";
			miconf = "sudo micro /etc/nixos/configuration.nix";
			sudo = "sudo";
		};
	};
}












