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

https://github.com/wbthomason/packer.nvim

	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

Useful maintenance commands:

    :PackerSynch
    :TSUpdate
    :Mason

## Keys

Following keys are mapped (prefixed with super):

	a dwm
	A dwm
	b dwm
	B sxhkd Brave
	c sxhkd LibreOffice calc
	C sxhkd Chrome
	d dwm
	D sxhkd pass cleanup
	e sxhkd dmenu urls
	E sxhkd dmenu urls
	f dwm
	F dwm
	g sxhkd pass pick
	G sxhkd pass retype
	h dwm
	H
	i dwm
	I
	j dwm
	J
	k dwm
	K
	l dwm
	L
	m dwm
	M dwm
	n sxhkd pass new
	N
	o
	O
	q dwm
	Q dwm
	p sxhkd proj
	P
	r
	R
	s sxhkd dmenu snippets
	S sxhkd dmenu snippets
	t sxhkd tmux terminal
	T dwm
	u sxhkd dmenu urls
	U sxhkd dmenu urls
	v
	V
	w sxhkd web browser Firefox
	W
	x sxhkd dmenu urls
	X sxhkd dmenu urls
	y
	Y
	z dwm
	Z dwm
