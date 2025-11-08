# LunaTranslator + Steam/Proton (Linux)

Run **[LunaTranslator](https://docs.lunatranslator.org/en/)** inside a game's **Proton prefix** WebView2 + **[Yomitan](https://yomitan.wiki/)** work on Linux.

---

## Scripts

| Script              | What it does                                                | When to run            |
|---------------------|-------------------------------------------------------------|------------------------|
| `install.sh`        | Installs protontricks/winetricks and saves env vars         | Once per machine       |
| `setup_game.sh`     | Prepares one game's Proton prefix and launches Luna         | Per game (first time)  |
| `launch_game.sh`    | Launches Luna inside the game’s Proton prefix               | Per game (every time)  |
| `restore_game.sh`   | Backs up & resets that game's Proton prefix                 | If the prefix breaks   |

---

## Prereqs

- Native Steam with Proton installed.
- **[WebView2 Evergreen Standalone (offline) x64 installer](https://developer.microsoft.com/en-us/microsoft-edge/webview2?cs=1424474517&form=MA13LH#download)**
- [Original **LunaTranslator** release](https://github.com/HIllya51/LunaTranslator/releases)

---

## One-time install

```bash
export WEBVIEW2_INSTALLER="/ABS/PATH/MicrosoftEdgeWebView2RuntimeInstallerX64.exe"
export LUNATRANSLATOR="/ABS/PATH/LunaTranslator.exe"
bash install.sh
source ~/.bashrc
```

This appends a `# Proton Luna` block with env vars to your `~/.bashrc`.

---

## Prepare a game (per AppID)

After you've run the game at least once, you can list detected prefixes / IDs:

```bash
protontricks -l
```

Then prepare the game and install WebView2 into that game's Proton prefix:

```bash
export STEAM_APPID=<YOUR_APPID>
bash setup_game.sh
```

---

## Daily use (launch Luna for that game)

```bash
export STEAM_APPID=<YOUR_APPID>
# Start the game in Steam first if you plan to HOOK
bash launch_game.sh
```

---

## Reset the game's Proton prefix (if broken)

```bash
export STEAM_APPID=<YOUR_APPID>
bash restore_game.sh
# Then start the game once in Steam and rerun:
bash setup_game.sh
```
