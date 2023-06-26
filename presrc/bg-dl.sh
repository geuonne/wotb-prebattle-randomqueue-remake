#!/bin/sh

repo_root="$(git rev-parse --show-toplevel)"
bg_list="${repo_root}/presrc/bg-list.yaml"

#shellcheck disable=SC2094
for mode in $(yq '.[] | key') ; do
	url="$(yq ".${mode}" < "${bg_list}")"
	curl "${url}" \
		| magick \
			  - \
			  -resize 2048x2048\! \
			  "${repo_root}/src/Gfx/Lobby/backgrounds/prebattle/bg_game-mode_${mode}.packed.webp"
done < "${bg_list}"
