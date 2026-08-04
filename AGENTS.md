# AGENTS.md

Instructions for working in this project only.

## Comms

- Loudly shout if something is wrong or not working as expected, lets work through it together
- Don't sit in the cave and try to hack your way out of it, just ask for help
- E.g. parts of this file are outdated due updates to cmux, we should update them together

## SKILLs

- Ensure that (if present) the `## Critical` and `### Opening in Browser` sections in `SKILL.md`
  files are concistent across the repo

## cmux

Read what version of cmux is installed by running:

```bash
defaults read /Applications/cmux.app/Contents/Info.plist CFBundleShortVersionString
```

- Use this [documentation](https://cmux.com/docs/configuration.md) as your source of truth for
  configuring cmux
- Ensure that `$schema` within `config.json` matches the version of cmux that is installed
- cmux is installed via Brew, managed by `hops.yml`; we should try to use the latest version where
  possible, and ensure that `$schema` is updated to match
- `install.sh` symlinks `cmux/config.json` to `~/.config/cmux/cmux.json`
- cmux will use verbose per binding object format if changes are made by hand, do not use that
  format, use plain strings (e.g. `"cmd+,"` or `""`) instead

### Keybindings

cmux ships with a tonne of keybindings, which I find are overwhelming and not useful. Ensure that
every binding ID is explicitly disabled. Take the list from the
`shortcuts.bindings.propertyNames.enum` array in `cmux.schema.json`. Disabling looks like this:

```json
{
  "shortcuts": {
    "bindings": {
      "toggleSidebar": "",
    }
  }
}
```

Then add the following keybindings, which I actually use and find useful:

- App
  - `openSettings` → `cmd+,`
  - `reloadConfiguration` → `cmd+shift+,`
  - `commandPalette` → `cmd+shift+p`
  - `quit` → `cmd+q`
- Workspaces
  - `newTab` → `cmd+n`
  - `goToWorkspace` → `cmd+p`
  - `nextSidebarTab` → `cmd+]`
  - `prevSidebarTab` → `cmd+[`
  - `closeWorkspace` → `cmd+shift+w`
- Surfaces
  - `newSurface` → `cmd+t`
  - `nextSurface` → `cmd+shift+]`
  - `prevSurface` → `cmd+shift+[`
  - `closeTab` → `cmd+w`
- Split Panes
  - `focusLeft` → `cmd+1`
  - `focusRight` → `cmd+2`
  - `splitRight` → `cmd+d`
  - `toggleSplitZoom` → `cmd+shift+enter`
  - `increaseWorkspaceTerminalFontSize` → `cmd+=`
  - `decreaseWorkspaceTerminalFontSize` → `cmd+-`
  - `resetWorkspaceTerminalFontSize` → `cmd+0`
  - `equalizeSplits` → `cmd+shift+=`
- Browser
  - `openBrowser` → `cmd+shift+l`
  - `focusBrowserAddressBar` → `cmd+l`
  - `browserReload` → `cmd+r`
- Notifications
  - `jumpToUnread` → `cmd+shift+u`
