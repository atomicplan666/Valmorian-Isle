// Retired virtue types - DO NOT DELETE THESE DECLARATIONS.
//
// preferences_savefile.dm's _load_virtue() reads virtue/virtuetwo/virtue_background by raw type
// path (WRITE_FILE(S["virtue"], virtue.type)), not by name string. If a type a character's save
// references stops existing entirely, the path can't resolve on load and silently falls through
// to /datum/virtue/none - no error, no warning, the player just loses that slot's content. This
// bit players for real on 2026-08-22 when the background system port deleted 10 virtues outright
// (utility/skilled, utility/apprentice, combat/bowman, combat/crossbowman, combat/combat_virtue,
// utility/granary, utility/performer, utility/tracker, utility/intellectual, items/arsonist)
// instead of retiring them like this.
//
// Species avoid this class of bug entirely because _load_species() saves by NAME STRING, with an
// explicit legacy_species_names remap table for renames (preferences_savefile.dm:412). Virtues
// have no equivalent string-based path, so the only way to keep an old save resolving is to keep
// the type itself defined, even if empty. `name = null` hides these from every virtue picker and
// listing in the codebase (they all early-return / `continue` on `!V.name`), so they're otherwise
// completely inert - a next-retirement of these same 10 can delete this file safely, since any
// save still referencing them will have already reset to /datum/virtue/none by then regardless.
//
// When retiring a virtue in the future: move it here (or its own stub) with `name = null` instead
// of deleting the definition outright.

/datum/virtue/utility/skilled
	name = null

/datum/virtue/utility/apprentice
	name = null

/datum/virtue/combat/bowman
	name = null

/datum/virtue/combat/crossbowman
	name = null

/datum/virtue/combat/combat_virtue
	name = null

/datum/virtue/utility/granary
	name = null

/datum/virtue/utility/performer
	name = null

/datum/virtue/utility/tracker
	name = null

/datum/virtue/utility/intellectual
	name = null

/datum/virtue/items/arsonist
	name = null
