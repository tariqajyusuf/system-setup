# System Setup

Script for autoconfiguring a new machine. Automatically detects platform and architecture before performing setup and module installation.

## How to use

Linux/Mac

```bash
curl -S "https://raw.githubusercontent.com/tariqajyusuf/system-setup/main/init.sh" | bash
```

Windows

```ps
Invoke-WebRequest https://raw.githubusercontent.com/tariqajyusuf/system-setup/main/init.ps1 | &
```

## Options

`-v` - Show all output from subcommands

## Future Things

- Create template for submoduling private settings like domain specific apps.
- Add Windows support.
- Allow configration of modules based on context.
- Actually use sudo in script so you don't have to run the script as sudo to begin with.
- Mac is relatively unstable and not being regularly tested, make sure to download and run with `-v`
- Powerline fonts for mac
- Fix patching on mac
- Unmount docker image on mac
- Better error checking

## Tests

- Ubuntu configruation runs on each push.
- Linter runs to make sure you didn't miss anything.
