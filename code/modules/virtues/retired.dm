// Retired virtue types - DO NOT DELETE THESE DECLARATIONS.
//
// preferences_savefile.dm's _load_virtue() reads virtue/virtuetwo/virtue_background by raw type
// path (WRITE_FILE(S["virtue"], virtue.type)), not by name string. If a type a character's save
// references stops existing entirely, the path can't resolve on load and silently falls through
// to /datum/virtue/none - no error, no warning, the player just loses that slot's content. This
// bit players for real on 2026-08-22 when the background system port deleted 10 virtues outright
// instead of retiring them like this.
//
// Species avoid this class of bug entirely because _load_species() saves by NAME STRING, with an
// explicit legacy_species_names remap table for renames (preferences_savefile.dm). Virtues have
// no equivalent string-based path, so the only way to keep an old save resolving is to keep the
// type itself defined.
//
// Each stub keeps a visible "(Retired)" display name - a null name renders the player's virtue
// button with a BLANK label, which live players read as "my virtue slot is gone" (reported
// 2026-08-22, post-hotfix). `unlisted = TRUE` keeps them out of every picker; `retired = TRUE`
// makes _load_virtue() nudge affected players to re-pick. They grant nothing.
//
// When retiring a virtue in the future: move it here as a stub like these instead of deleting
// the definition outright.

/datum/virtue/utility/skilled
	name = "Skilled Apprentice (Retired)"
	desc = "This virtue has been retired - its role now lives in the Background slot. Pick a new virtue; it grants nothing anymore."
	unlisted = TRUE
	retired = TRUE

/datum/virtue/utility/apprentice
	name = "Labourious Apprentice (Retired)"
	desc = "This virtue has been retired - its role now lives in the Background slot (Miner's Apprentice). Pick a new virtue; it grants nothing anymore."
	unlisted = TRUE
	retired = TRUE

/datum/virtue/combat/bowman
	name = "Toxophilite (Retired)"
	desc = "This virtue has been retired - its role now lives in the Background slot (Toxophilite). Pick a new virtue; it grants nothing anymore."
	unlisted = TRUE
	retired = TRUE

/datum/virtue/combat/crossbowman
	name = "Marksman (Retired)"
	desc = "This virtue has been retired - its role now lives in the Background slot (Toxophilite, Crossbowman loadout). Pick a new virtue; it grants nothing anymore."
	unlisted = TRUE
	retired = TRUE

/datum/virtue/combat/combat_virtue
	name = "Trained & Ready (Retired)"
	desc = "This virtue has been retired - its role now lives in the Background slot (Duelist's, Dungeoneer's, Brawler's Apprentice, Militiaman). Pick a new virtue; it grants nothing anymore."
	unlisted = TRUE
	retired = TRUE

/datum/virtue/utility/granary
	name = "Cunning Provisioner (Retired)"
	desc = "This virtue has been retired - its role now lives in the Background slot (Cunning Provisioner). Pick a new virtue; it grants nothing anymore."
	unlisted = TRUE
	retired = TRUE

/datum/virtue/utility/performer
	name = "Performer (Retired)"
	desc = "This virtue has been retired - its role now lives in the Background slot (Performer). Pick a new virtue; it grants nothing anymore."
	unlisted = TRUE
	retired = TRUE

/datum/virtue/utility/tracker
	name = "Sleuth (Retired)"
	desc = "This virtue has been retired - its role now lives in the Background slot (Sleuth). Pick a new virtue; it grants nothing anymore."
	unlisted = TRUE
	retired = TRUE

/datum/virtue/utility/intellectual
	name = "Intellectual (Retired)"
	desc = "This virtue has been retired - its role now lives in the Background slot (Intellectual). Pick a new virtue; it grants nothing anymore."
	unlisted = TRUE
	retired = TRUE

/datum/virtue/items/arsonist
	name = "Arsonist (Retired)"
	desc = "This virtue has been retired - its role now lives in the Background slot (Rogue Alchemist). Pick a new virtue; it grants nothing anymore."
	unlisted = TRUE
	retired = TRUE
