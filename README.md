## Overview

Personal dotfiles and shell scripts.

## Usage

Just browse the files and copy what you need.

## Structure

* [bin/](bin/) - scripts for managing the dotfiles
* [completion/](completion/) - zsh completions for the above
* [lib/](lib/) - the actual dotfiles
	* ...
	* [lib/.local/bin/](lib/.local/bin/) - custom scripts
	* [lib/.local/completion/](lib/.local/completion/) - zsh completions for the above
	* ...

## Vim

I use [Neovim](https://neovim.io/) with [Packer](https://github.com/wbthomason/packer.nvim) plugin manager.

To install packer, run:

	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

You can take a look at the Vim plugins I currently use [here](lib/.config/nvim/lua/init/plugins.lua).

Useful maintenance commands:

	:PackerSynch
	:TSUpdate
	:Mason

## Windows manager

I use a [personal fork](https://github.com/maicher/dwm) of [DWM](https://dwm.suckless.org/) with some additional patches applied.

DWM is useful as it auto arranges windows on your screen so that you don't have to drag them around using mouse.

## File manager

I use [lf](https://github.com/gokcehan/lf) file manager which is fast and also serves as an entry point for running scripts.

As it runs in terminal I use it also over SSH on servers.

## Hotkeys

For system wide hotkeys I use the [sxhkd](https://github.com/baskerville/sxhkd) which has
a convenient way of configuring the bindings.

Below is the list of mapping I use.
In both dwm and sxiv the prefix key is `super`, which gives:

	key description                     managed by
	--- ----------------------------    ----
	0-9 view windows with given tag     dwm
	a   view windows with `a` tag       dwm
	A   add `a` tag to focused window   dwm
	b   toggle dwm's bar                dwm
	B   launch Brave                    sxhkd
	c   launch LibreOffice cal          sxhkd
	C   launch Chrome                   sxhkd
	d   decrease numer of windows in master area  dwm
	D   clear otp                       sxhkd
	e
	E
	f   set floating layout             dwm
	F   set floating master             dwm
	g   show passwords dmenu            sxhkd
	G   add new password to gopass      sxhkd
	h   focus prev window               dwm
	H
	i   increase number of windows in master area  dwm
	I
	j   decrease master area size       dwm
	J
	k   increase master area size       dwm
	K
	l   focus next window               dwm
	L
	m   set monocle layout              dwm
	M   set centered master layout      dwm
	n
	N
	o
	O
	q   close focused window            dwm
	Q   restart dwm                     dwm
	p   show projects dmenu
	P
	r   retype password                 sxhkd
	R   retype login                    sxhkd
	s   show snippets dmenu             sxhkd
	S   edit snippets                   sxhkd
	t   launch tmux with terminal       sxhkd
	T   set tiled layout                dwm
	u   show URL snippets dmenu         sxhkd
	U   edit URL snippets               sxhkd
	v
	V
	w   launch Firefox                  sxhkd
	W
	x
	X
	y
	Y
	z   view windows with z tag         dwm
	Z   add z tag to focused window     dwm
