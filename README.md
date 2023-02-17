# WoT Blitz - Prebattle RandomQueue Extended mod

![](public/media/1.png)
![](public/media/2.png)

## Description
* [en](public/desc/en.txt)
* [ru](public/desc/ru.txt)

## Install
### Manual install
1. Download the `.zip` file from **Releases** section
2. Unpack chosen `.zip` file to `~res:/`

`~res:/` is the gamedata root:
- Android: `/your_sdcard/Android/data`
- Steam: `\Path\To\Steam\steamapps\common\World of Tanks Blitz`
- Windows Store: `...`

### Build from source

Dependencies
- [`dvpl` converter](https://github.com/Maddoxkkm/dvpl_converter)
- `make`
- `7z`
- `coreutils` (or any other POSIX-compliant util)

```sh
make [WMOD_TARGETPLATFORM=(android|pc)] [WMOD_TARGETPUBLISHER=(wg|lg|any)]
```

See [Makefile](Makefile) for details.

### Install
```sh
make [WMOD_TARGETPLATFORM=...] [WMOD_TARGETPUBLISHER=...]
make [WMOD_TARGETPLATFORM=...] [WMOD_TARGETPUBLISHER=...] WMOD_INSTALLDIR=<your_path_to_game> install
```
### Deploy .zip package
```sh
make [WMOD_TARGETPLATFORM=...] [WMOD_TARGETPUBLISHER=...] package
```

## Media sources
* [`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_random`](https://media-wbp.wgcdn.co/media/filer_public_thumbnails/filer_public/images/Summer_Season_2021_Championships_1-1920-1080.jpg__1048x590_q95_crop_subsampling-2.jpg)
* [`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_tournament`](https://media-wbp.wgcdn.co/media/filer_public_thumbnails/filer_public/images/autumn-season-tournaments-20211-920х1080.jpg__1048x590_q95_crop_subsampling-2.jpg)
* [`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_rating`]()
* [`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_madgames`](https://media-wbp.wgcdn.co/media/filer_public/2a/fa/2afa6351-5c21-47af-a5a5-405a676e2687/mad_games_keyart.jpg)
* [`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_realistic`](https://media-wbp.wgcdn.co/media/filer_public/images/realistic-battles_1920x1080_top-bottom.jpg)
* [`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_uprising`](https://media-wbp.wgcdn.co/media/filer_public/images/WOTB_Rebirth_1920x1080_min.jpg)
* [`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_gravity`](https://media-wbp.wgcdn.co/media/filer_public/images/Gravity-force_1920x1080.jpg)
* [`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_skirmish`](https://pbs.twimg.com/media/Es0PI5jXIAUoFyz?format=jpg&name=medium)
* [`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_burninggames`](https://media-wbp.wgcdn.co/media/filer_public/images/WoTB-Art-Burning-Games-1920x1080.jpg)
* [`~res:/Gfx/lobby/backgrounds/prebattle/bg_game-mode_bigboss`](https://media-wbp.wgcdn.co/media/filer_public_thumbnails/filer_public/images/Boss-mode-banner_1920х1080_fBKKo02.jpg__1048x590_q95_crop_subsampling-2.jpg)
