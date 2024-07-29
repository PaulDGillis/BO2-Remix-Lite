# Call of Duty: Black Ops II Zombies - Remix Lite - Different name pending

## Created by: Pauldg 
### Forked from 5and5's Remix

## Download

[Download](https://github.com/PaulDGillis/BO2-Remix-Lite/releases/download/latest/BO2-Remix-Lite.zip)

## How to Install

### Automatic Installer

- Download and install BO2 Plutonium [Plutonium Download](https://plutonium.pw/)
- Download the latest version of [Remix Installer](https://github.com/PaulDGillis/BO2-Remix-Lite/releases/download/Installer/BO2-Remix-Lite-Installer.bat)
- Double click on "BO2-Remix-Lite-Installer.bat" this will download the latest version of Remix and copy all the files into `%localappdata%\Plutonium\storage\t6`
- Launch the game and enjoy!

### Manual Installation

- Download and install BO2 Plutonium [Plutonium Download](https://plutonium.pw/)
- Download the latest version of [Remix](https://github.com/PaulDGillis/BO2-Remix-Lite/releases/download/latest/BO2-Remix-Lite.zip)
- Open "BO2-Remix-Lite.zip" and copy everything into `%localappdata%\Plutonium\storage\t6`
- Launch the game and enjoy!

## Change Notes

### General
- Coop pause

### Visual

- Tweaked graphics
- Tweaked vision set
- Rotating skybox
- Fog disabled
- Night mode option with `night_mode 1`
- Change zombies eye color with `eye_color 1`

### Patches
- In game fast ray `rapid_fire 1`
- Characters can be selected with `character`

### HUD
- Zombies remaining counter
- Current zone
- Trap timer
- All hud can be turned on with `hud_all 1`
- Hud text color can be changed with `hud_color 1 1 1` "1" can be any value from 0 to 1

### Power Ups
- Max ammos refill clip as well
- Insta kill timer stacks
- Double points timer stacks
- Nukes kill zombies faster
- Perk bottles give extra perk slot
- Effect added to the first drop of a new powerup cycle

### Perks

- Players can sprint while drinking perks
- Perk bottles also increase players perk limit by 1
- Who's who wont activate when player has quick revive

### Mystery Box

- Weapons can be shared by knifing the box
- Box moves instantly now

### Weapons
- Buying wall weapon ammo fills clip

## Custom Dvars

```
coop_pause
night_mode
character
disable_player_quotes
hud_all
hud_remaining
hud_zone
hud_color
```

## Custom Binds

```
bind F8 "toggle coop_pause 1 0"
```

## Config settings

```
seta hud_remaining "0"
seta hud_zone "1"
seta disable_player_quotes "0"
seta night_mode "1"
seta character "1"
```

### VSCode Tasks
- Clean Build (Deletes compiled scripts)
- Build (Uses gsc-tool to compile .gsc scripts for Bo2)
- BuildZip (Requires 7zip, zips compiled scripts similar to the github release action)
- CleanInstall (Deletes scripts from Plutonium directory)
- Install (Clean, Build, and Install's mod to default plutonium directory)

## Credits
- 5and5
- JezuzLizard
- JBleezy
- ZECxR3ap3r
- Bandit
- TTS
- Naomi
- Chase
- DoktorSAS
- HuthTV
