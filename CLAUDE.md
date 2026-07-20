# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Valmorian Isle is a medieval-fantasy Space Station 13 server built on BYOND's DM language. It is a fork of Azure-Peak (itself a Roguetown/tg-station derivative). The compiled environment is `roguetown.dme` / `roguetown.dmb`.

## Current Effort: Emerald Summit rebase

This repo is the new base for the Emerald Summit server. Related local clones:

- `C:\Users\belia\OneDrive\Desktop\emerald-summit\Emerald-Summit` — the old Emerald Summit repo (also an Azure-Peak fork; remote `origin` = Furnace-Chronicles/Emerald-Summit).
- `C:\Users\belia\OneDrive\Desktop\Azure-Peak` — the shared upstream.

The Emerald Summit map is ported (`_maps/dun_world_2.dm` + `_maps/map_files/dun_world/dun_world_2.dmm`, registered in `config/maps.txt`). All ES content it needs lives in `modular/emerald_summit/code/` (with `_defines.dm` for ES defines and `_extensions.dm` for vars/procs grafted onto Valmorian base types); ES-specific icons are under `modular/emerald_summit/icons/`. When porting more ES content, follow that pattern: extract the definition blocks from the Emerald-Summit clone, place them in the pack, add `.dme` includes, and copy icon/sound assets. Known stubs: `/obj/structure/broadcast_horn` (ES scomm comms not ported — Valmorian rewrote scomm), and the ambush thief NPC lost ES AI vars (different NPC AI system here).

## Build & Development Commands

- **Build (Windows):** double-click `BUILD.cmd` in the repo root, or run `tools/build/build.bat`. In VSCode, `Ctrl+Shift+B` builds; `F5` builds and runs with the debugger.
- **Build (Linux):** `tools/build/build.sh`. `--help` lists available build targets.
- The build script (Juke-based, from /tg/station) compiles both DM code and tgui JavaScript, skipping unchanged steps. Compiled tgui bundles are NOT committed; always build via the script rather than DM alone if tgui changed.
- **tgui lint:** `npm run tgui:lint` (Biome). **Auto-fix:** `npm run tgui:fix`.
- **DM linting:** SpacemanDMM / dreamchecker, configured in `SpacemanDMM.toml` — most diagnostics are errors, including `must_call_parent`, sleep/purity checks, and disallowed relative type/proc definitions (always use absolute type paths when defining procs/vars).
- There is no conventional unit-test command; correctness is checked by compiling (`BUILD.cmd`) and dreamchecker.

## Architecture

- `roguetown.dme` — master include list. **Every new `.dm` file must be added to the `.dme`** (inside the `BEGIN_INCLUDE`/`END_INCLUDE` block, in path-sorted order) or it won't compile.
- `code/` — core game code, tg-station layout:
  - `code/__DEFINES/` — preprocessor defines/macros (include-order sensitive, loaded first).
  - `code/__HELPERS/` — global helper procs.
  - `code/controllers/` — Master Controller (MC) and subsystems (`SS*`).
  - `code/datums/`, `code/game/`, `code/modules/` — datums, atoms/machinery, and gameplay systems (jobs, combat, mobs, etc.).
- `modular/` — modular content packs layered on top of core code (e.g. `Neu_Farming`, `Neu_Food`, `ambush`, `Mapping`). Prefer putting new standalone content here rather than editing core files, following existing pack structure.
- `_maps/` — maps. Each playable map has a `.json` definition in `_maps/` plus a loader `.dm` and `.dmm` files under `_maps/map_files/`. Map rotation/voting is configured in `config/maps.txt` (`map <name>` blocks referencing the json name).
- `config/` — server runtime configuration (`game_options.txt`, `maps.txt`, etc.), read at runtime, not compiled.
- `tgui/` — React/TypeScript UI framework (tg-station's tgui); interfaces live in `tgui/packages/tgui/interfaces/`.
- `interface/`, `icons/`, `sound/`, `strings/` — client skin, sprites (`.dmi`), audio, and text data.
- `goon/` — code ported from Goonstation (separate license considerations).
- `SQL/` — database schema for the optional MariaDB backend (`libmariadb.dll`).
- Rust helper library `rust_g.dll` / `librust_g.so` provides native functions called from DM.

## DM (SS13) Coding Conventions

Follow /tg/station code standards:

- Tabs for indentation; `snake_case` for procs/vars; `SCREAMING_CASE` for defines; `PascalCase`-ish for datum procs only when matching existing style.
- **Absolute type paths only** for definitions — write `/obj/item/sword/proc/sharpen()` at top level, never nest relative definitions (`.toml` enforces this as an error).
- When overriding a proc, call `..()` unless suppressing the parent is deliberate — dreamchecker enforces `must_call_parent`.
- Never `sleep()` or block inside procs marked `SHOULD_NOT_SLEEP`; prefer signals/callbacks (`COMSIG_*`, `CALLBACK()`) and subsystem processing over spawn/sleep loops.
- Use `initialize()`/`Initialize(mapload)` for atom setup, not `New()`, where the codebase does.
- New `.dm` files must be added to `roguetown.dme` in path-sorted order within the include block.
- Map files (`.dmm`) must only reference typepaths that compile; edit `.dmm` files with a map editor (StrongDMM) or careful text edits preserving the tile-dictionary format — never reformat them.
- Icons are `.dmi` binaries; when porting content, bring its `icon`/`icon_state` source files along and verify the states exist.
- Prefer adding content under `modular/` rather than editing core `code/` files when the change is standalone.

## tgui Coding Conventions

- tgui is React + TypeScript under `tgui/packages/tgui/`; interfaces live in `tgui/packages/tgui/interfaces/`.
- Use the tgui component library (`Button`, `Section`, `Stack`, `LabeledList`, etc.) from `tgui/components` instead of raw HTML.
- Get backend state with `useBackend<Data>()`; send actions with `act('action_name', { params })`, handled in the datum's `ui_act()` on the DM side; `ui_data()`/`ui_static_data()` supply state.
- Lint/format with Biome: `npm run tgui:lint`, fix with `npm run tgui:fix`. Never commit built tgui bundles — the build script produces them.
