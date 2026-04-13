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

## Editor

[Neovim](https://neovim.io/) (v0.12.1) with [pckr.nvim](https://github.com/lewis6991/pckr.nvim) plugin manager.

You can take a look at the Vim plugins used [here](lib/.config/nvim/lua/init/plugins.lua).

Useful maintenance commands:

    :Pckr sync
    :TSUpdate
    :Mason
    :checkhealth vim.lsp

## X Window Manager

Tiling window managers automatically organize open windows so that you don't have to drag them around using a mouse.

I use a [personal fork](https://github.com/maicher/dwm) of [DWM](https://dwm.suckless.org/) with some additional patches applied.

## File Manager

I use [lf](https://github.com/gokcehan/lf) file manager, which is fast and also serves as an entry point for running scripts.

As it runs in the terminal, I also use it over SSH on servers.

## Hotkeys

For system-wide hotkeys I use [sxhkd](https://github.com/baskerville/sxhkd), which has
a convenient way of configuring the bindings.

Below is the list of mappings I use.
In both DWM and sxiv the prefix key is `super`, which gives:

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
	o   show docs dmenu                 sxhkd
	O   edit docs                       sxhkd
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
	W   launch Firefox incognito        sxhkd
	x
	X
	y
	Y
	z   view windows with z tag         dwm
	Z   add z tag to focused window     dwm
