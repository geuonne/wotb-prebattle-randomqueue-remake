# WoT Blitz - Prebattle RandomQueue Extended mod

[public/media/1.png]
[public/media/.png]

-------------------------------------------------------------------------------

## Description
* [en](public/DESCRIPTION-en.txt)
* [ru](public/DESCRIPTION-ru.txt)

## Install

### Manual install
1. Download the `.zip` file from **Releases** section
2. Unpack `.zip` files of your choice to `~res:/`

~res:/ is the gamedata root:
- Android: `/your_sdcard/Android/data/net.wargaming.wot.blitz/files/packs`
- Steam: `\Path\To\Steam\steamapps\common\World of Tanks Blitz\Data`
- Windows Store: ...

### Build from source

Dependencies
- [`dvpl`](https://github.com/Maddoxkkm/dvpl_converter)
- `make`
- `p7zip`

### Install
```sh
make [WMOD_TARGETPLATFORM=<target_platform>] [WMOD_TARGET_PUBLISHER=...]
make install [WOTB_BASE=...] [WOTB_PREFIX=<Data|files/packs>]
```
### Deploy
```sh
make public
```

## Media sources
[https://media-wbp.wgcdn.co/media/filer_public_thumbnails/filer_public/images/Summer_Season_2021_Championships_1-1920-1080.jpg__1048x590_q95_crop_subsampling-2.jpg](`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_random`)
[https://media-wbp.wgcdn.co/media/filer_public_thumbnails/filer_public/images/autumn-season-tournaments-20211-920х1080.jpg__1048x590_q95_crop_subsampling-2.jpg](`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_tournament`)
[](`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_rating`)
[https://media-wbp.wgcdn.co/media/filer_public/2a/fa/2afa6351-5c21-47af-a5a5-405a676e2687/mad_games_keyart.jpg](`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_madgames`)
[https://media-wbp.wgcdn.co/media/filer_public/images/realistic-battles_1920x1080_top-bottom.jpg](`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_realistic`)
[https://media-wbp.wgcdn.co/media/filer_public/images/WOTB_Rebirth_1920x1080_min.jpg](`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_uprising`)
[https://media-wbp.wgcdn.co/media/filer_public/images/Gravity-force_1920x1080.jpg](`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_gravity`)
[https://pbs.twimg.com/media/Es0PI5jXIAUoFyz?format=jpg&name=medium](`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_skirmish`)
[https://media-wbp.wgcdn.co/media/filer_public/images/WoTB-Art-Burning-Games-1920x1080.jpg](`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_burninggames`)
[https://media-wbp.wgcdn.co/media/filer_public_thumbnails/filer_public/images/Boss-mode-banner_1920х1080_fBKKo02.jpg__1048x590_q95_crop_subsampling-2.jpg](`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_bigboss`)
