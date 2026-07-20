# dun_world_2 mapping TODO — content missing vs Valmorian's dun_world

Generated 2026-07-20 by diffing `dun_world_2.dmm` (Emerald Summit port) against
`dun_world.dmm` (current Valmorian map). All coordinates are `(x, y, z)` positions
**in dun_world.dmm** — open it side-by-side in StrongDMM and copy from there.
678 typepaths used by dun_world are absent from dun_world_2; the functional ones
are broken down below. Purely cosmetic drift (about 1,400 `/obj/effect/decal/edge`
decals, the `/obj/machinery/light/rogue/candle` family, and ~358 loot/clutter item
types that live inside the missing zones) is omitted from the lists.

## Priority 1 — job spawn landmarks (roles cannot spawn without these)

sexton, vagabond, warden, bathworker, tapster, trader, innkeeper, bathmaster,
bishop, seneschal, inquisitor, hostage — coordinates in the placement list below.

## Priority 2 — economy machines (Valmorian's fund/banking system is dead without them)

Per-fund vaultbanks (church/innkeeper/merchant/bathhouse), goldface pay terminals,
escrow machines, paired hermes mail, steward_export, contractledger,
ship_fulfillment, scrappers, keep/church vendors.

## Priority 3 — quest & dungeon systems

quest_spawner landmarks, chimeric_calyx_spawner network (267 placements — these feed
the chimeric slab system), chest_or_mimic spawners, deaths_door exit, psy_bog oneways.

## Priority 4 — new zones (self-contained regions with their own areas/mobs/loot)

See the zone inventory at the bottom; each entry gives the bounding box in
dun_world.dmm so you can view the whole region. Underworld dungeons (his_vault,
underdark, bogcaves, licharena, minotaur content, taricheamanor) are the most
gameplay-relevant; the beach/woods surface zones only make sense if the ES surface
layout has room for them.

---

## Placement list (functional types, with dun_world.dmm coordinates)

```
  26x /obj/effect/landmark/chest_or_mimic/locked_or_trapped
      at (10,435,z1), (27,419,z1), (32,335,z1), (41,210,z1) +22 more
  12x /obj/effect/landmark/chimeric_calyx_spawner
      at (23,207,z1), (25,319,z1), (43,199,z1), (88,410,z1) +8 more
 227x /obj/effect/landmark/chimeric_calyx_spawner/fifteen
      at (4,56,z1), (7,252,z1), (12,163,z1), (13,84,z1) +223 more
  28x /obj/effect/landmark/chimeric_calyx_spawner/thirty
      at (163,48,z1), (165,40,z1), (166,52,z1), (167,101,z1) +24 more
   1x /obj/effect/landmark/deaths_door/exit
      at (54,328,z4)
 113x /obj/effect/landmark/quest_spawner/generic
      at (12,252,z1), (28,290,z1), (36,256,z1), (38,239,z1) +109 more
   1x /obj/effect/landmark/start/bathmaster
      at (69,57,z1)
   4x /obj/effect/landmark/start/bathworker
      at (41,53,z1), (42,53,z1), (44,51,z1), (46,51,z1)
   2x /obj/effect/landmark/start/bishop
      at (68,77,z2), (55,83,z4)
   2x /obj/effect/landmark/start/hostage
      at (120,103,z1), (122,105,z1)
   1x /obj/effect/landmark/start/innkeeper
      at (63,46,z2)
   1x /obj/effect/landmark/start/inquisitor
      at (17,120,z4)
   1x /obj/effect/landmark/start/seneschal
      at (150,86,z4)
  14x /obj/effect/landmark/start/sexton
      at (63,73,z2), (63,72,z2), (63,71,z2), (63,70,z2) +10 more
   5x /obj/effect/landmark/start/tapster
      at (59,34,z1), (64,41,z2), (65,41,z2), (66,41,z2) +1 more
   4x /obj/effect/landmark/start/trader
      at (15,4,z4), (16,4,z4), (19,4,z4), (22,4,z4)
   6x /obj/effect/landmark/start/vagabond
      at (52,81,z2), (57,56,z2), (75,124,z2), (77,53,z2) +2 more
   4x /obj/effect/landmark/start/warden
      at (158,128,z4), (159,128,z4), (166,129,z4), (166,125,z4)
   6x /obj/effect/oneway/psy_bog
      at (35,222,z2), (36,222,z2), (37,222,z2), (43,240,z2) +2 more
  18x /obj/effect/oneway/psy_bog_two
      at (43,242,z2), (43,241,z2), (43,240,z2), (70,239,z2) +14 more
   1x /obj/structure/roguemachine/bathvend/public
      at (57,55,z1)
   2x /obj/structure/roguemachine/chimeric_slab
      at (77,80,z1), (82,103,z1)
   3x /obj/structure/roguemachine/contractledger
      at (61,54,z2), (64,44,z2), (97,58,z2)
   1x /obj/structure/roguemachine/escrow
      at (95,70,z2)
   1x /obj/structure/roguemachine/escrow/tailor
      at (82,43,z2)
   1x /obj/structure/roguemachine/goldface/public/apothecary
      at (99,118,z2)
   1x /obj/structure/roguemachine/goldface/public/smith
      at (89,64,z2)
   1x /obj/structure/roguemachine/goldface/public/tailor
      at (77,42,z2)
   4x /obj/structure/roguemachine/hag_ward
      at (28,197,z3), (49,261,z3), (106,230,z3), (50,212,z4)
   1x /obj/structure/roguemachine/mail/paired_hermes/bathhouse
      at (40,38,z1)
   1x /obj/structure/roguemachine/mail/paired_hermes/cove
      at (244,409,z1)
   1x /obj/structure/roguemachine/mossmother
      at (52,248,z3)
   6x /obj/structure/roguemachine/mossmother/travel
      at (11,31,z2), (212,306,z2), (85,169,z3), (7,354,z4) +2 more
   7x /obj/structure/roguemachine/noticeboard/wall
      at (65,42,z2), (77,47,z2), (93,41,z2), (95,58,z2) +3 more
   2x /obj/structure/roguemachine/potionseller/university
      at (95,120,z2), (124,54,z2)
   3x /obj/structure/roguemachine/scomm/receive_only
      at (174,97,z2), (186,97,z2), (125,187,z4)
   3x /obj/structure/roguemachine/scomm/receive_only/l
      at (121,80,z1), (11,205,z3), (16,116,z3)
   1x /obj/structure/roguemachine/scomm/receive_only/r
      at (183,116,z2)
   1x /obj/structure/roguemachine/scrapper/smith
      at (89,75,z2)
   1x /obj/structure/roguemachine/scrapper/tailor
      at (81,48,z2)
   1x /obj/structure/roguemachine/ship_fulfillment
      at (96,46,z2)
   1x /obj/structure/roguemachine/steward_export
      at (104,54,z2)
  11x /obj/structure/roguemachine/talkstatue/mercenary
      at (71,51,z1), (61,54,z2), (80,103,z2), (97,58,z2) +7 more
   1x /obj/structure/roguemachine/vaultbank/bathhouse
      at (69,61,z1)
   1x /obj/structure/roguemachine/vaultbank/church
      at (65,74,z4)
   1x /obj/structure/roguemachine/vaultbank/innkeeper
      at (65,35,z1)
   1x /obj/structure/roguemachine/vaultbank/merchant
      at (103,43,z1)
   1x /obj/structure/roguemachine/vendor/church_bedroomset_one
      at (77,79,z3)
   1x /obj/structure/roguemachine/vendor/church_bedroomset_two
      at (77,82,z4)
   1x /obj/structure/roguemachine/vendor/inq_keys
      at (18,113,z2)
   1x /obj/structure/roguemachine/vendor/keep_councillors
      at (128,100,z3)
   1x /obj/structure/roguemachine/vendor/keep_guests
      at (144,80,z1)
   1x /obj/structure/roguemachine/vendor/keep_knights
      at (126,97,z2)
   1x /obj/structure/roguemachine/vendor/keep_princes
      at (127,99,z4)
   1x /obj/structure/roguemachine/vendor/keep_servant
      at (157,100,z2)
   1x /obj/structure/roguemachine/vendor/keep_squire
      at (144,93,z2)
   2x /obj/structure/roguemachine/vendor/mobile
      at (98,41,z2), (99,41,z2)
   1x /obj/structure/roguemachine/vendor/stablemaster
      at (101,133,z2)
```

## Zone inventory (missing areas, largest first)

```
16098 tiles  z1  box (149,149)-(255,450)  /area/rogue/outdoors/beach/central
12395 tiles  z1  box (1,307)-(102,450)  /area/rogue/under/underdark/north
 8274 tiles  z3  box (128,362)-(255,450)  /area/rogue/outdoors/beach/forest/north
 7961 tiles  z1  box (154,303)-(255,450)  /area/rogue/outdoors/beach/north
 7772 tiles  z3  box (127,311)-(255,362)  /area/rogue/outdoors/beach/forest/south
 7203 tiles  z1  box (126,231)-(247,317)  /area/rogue/under/cavewet/bogcaves/north
 6578 tiles  z1  box (180,1)-(255,97)  /area/rogue/outdoors/beach/south
 6190 tiles  z2  box (178,391)-(255,436)  /area/rogue/outdoors/beach/forest/hamlet
 5861 tiles  z2  box (115,152)-(251,308)  /area/rogue/outdoors/woods/southeast
 5551 tiles  z1  box (126,163)-(240,260)  /area/rogue/under/cavewet/bogcaves/south
 5505 tiles  z2  box (126,208)-(209,304)  /area/rogue/outdoors/woods/south
 5412 tiles  z3  box (13,230)-(101,331)  /area/rogue/outdoors/bog/north
 5144 tiles  z1  box (1,158)-(90,226)  /area/rogue/under/underdark/south
 4919 tiles  z3  box (2,151)-(101,229)  /area/rogue/outdoors/bog/south
 4808 tiles  z1  box (77,173)-(125,309)  /area/rogue/under/cavewet/bogcaves/west
 3585 tiles  z2  box (6,3)-(67,87)  /area/rogue/druidsgrove
 3341 tiles  z3  box (96,280)-(238,330)  /area/rogue/outdoors/woods/north
 3180 tiles  z1  box (58,305)-(109,406)  /area/rogue/indoors/cave/west
 3176 tiles  z1  box (160,319)-(233,430)  /area/rogue/indoors/cave/east
 3015 tiles  z2  box (15,174)-(97,245)  /area/rogue/under/cave/his_vault
 2769 tiles  z1  box (110,334)-(161,405)  /area/rogue/indoors/cave/central
 2531 tiles  z1  box (90,405)-(160,450)  /area/rogue/indoors/cave/northern
 2458 tiles  z1  box (134,297)-(222,339)  /area/rogue/indoors/cave/southern
 2378 tiles  z3  box (53,394)-(124,442)  /area/rogue/outdoors/mountains/decap/minotaurfort
 2096 tiles  z2  box (1,160)-(18,287)  /area/rogue/under/cave/spider
 1696 tiles  z2  box (109,57)-(164,112)  /area/rogue/outdoors/exposed/town/keep/unbuildable
 1524 tiles  z1  box (88,307)-(134,349)  /area/rogue/indoors/cave/underhamlet
 1348 tiles  z4  box (96,403)-(127,449)  /area/rogue/under/cave/taricheamanor
  928 tiles  z2  box (107,218)-(128,284)  /area/rogue/outdoors/woods/southwest
  902 tiles  z4  box (75,177)-(115,228)  /area/rogue/outdoors/rtfield/abandonedhotsprings
  654 tiles  z2  box (7,255)-(30,286)  /area/rogue/under/cave/licharena/bossroom
  620 tiles  z2  box (106,26)-(154,51)  /area/rogue/outdoors/exposed/magiciantower
  530 tiles  z3  box (4,190)-(22,213)  /area/rogue/indoors/shelter/bog/skeletonfort
  505 tiles  z2  box (59,238)-(83,263)  /area/rogue/under/cave/his_vault/four
  454 tiles  z4  box (6,360)-(29,384)  /area/rogue/outdoors/mountains/decap/banditcamp
  441 tiles  z1  box (58,67)-(107,169)  /area/rogue/indoors/town/church/basement
  433 tiles  z2  box (87,51)-(107,60)  /area/rogue/indoors/town/steward
  397 tiles  z3  box (114,311)-(132,326)  /area/rogue/indoors/town/zhurch
  389 tiles  z1  box (66,87)-(99,106)  /area/rogue/indoors/town/pestra_sanctum
  371 tiles  z3  box (39,251)-(66,277)  /area/rogue/indoors/shelter/bog/bogmanfort
  315 tiles  z3  box (8,332)-(25,353)  /area/rogue/outdoors/mountains/decap/gunduzirak/bossarena
  296 tiles  z3  box (5,96)-(39,112)  /area/rogue/indoors/inq/embassy
  290 tiles  z3  box (18,112)-(38,126)  /area/rogue/indoors/inq/chapel
  276 tiles  z2  box (28,222)-(44,245)  /area/rogue/under/cave/his_vault/puzzle
  157 tiles  z1  box (13,25)-(29,35)  /area/rogue/under/cave/peace
  108 tiles  z4  box (104,197)-(116,209)  /area/rogue/indoors/abandonedhotsprings
  101 tiles  z4  box (3,368)-(17,385)  /area/rogue/under/cave/minotaurcave
   89 tiles  z2  box (40,197)-(50,205)  /area/rogue/under/cave/his_vault/two
   77 tiles  z2  box (47,240)-(57,246)  /area/rogue/under/cave/his_vault/one
   54 tiles  z2  box (63,197)-(69,204)  /area/rogue/under/cave/his_vault/three
   50 tiles  z4  box (11,364)-(15,376)  /area/rogue/indoors/shelter/mountains/decap/banditcamp
   27 tiles  z3  box (114,31)-(153,450)  /area/rogue
   25 tiles  z1  box (67,59)-(71,63)  /area/rogue/outdoors/exposed/bath/vault
   20 tiles  z1  box (88,193)-(236,296)  /area/rogue/under/cavewet/bogcaves/central
```

## Also missing (summary)

- 31 NPC/mob types: orc warband (marauder/footsoldier/berserker/warlord/archer),
  skeleton npc difficulty tiers, bog deserters, mad-touched treasure hunters,
  zardman jailer mages, psy vault guards, deadites, fae — all live inside the
  zones above and come along when copying those regions.
- 25 turf types and 102 structure types — overwhelmingly the fabric of the missing
  zones (new wall/floor variants, zone-specific doors and props); copying regions
  in StrongDMM brings them automatically.
