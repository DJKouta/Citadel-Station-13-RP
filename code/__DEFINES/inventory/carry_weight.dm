//* This file is explicitly licensed under the MIT license. *//
//* Copyright (c) 2023 Citadel Station developers.          *//

//? Despite this being carry_weight.dm, this contains defines for:
//? carry strength - how much someone can carry or move
//? weight - how much stuff weighs, recursive
//? encumberence - how hard it is to move with an item, non-recursive

//* CHECK https://www.desmos.com/calculator/o44o3naob2 FOR INFORMATION *//
//* DO nOT CHANGE ANY CONSTANTS WItHOUT GRAPHING IT OUT FIRST.         *//

//? Carry strength - flat strength. you can carry up to this with no penalty.

#define CARRY_STRENGTH_BASELINE 20

#define CARRY_STRENGTH_ADD_HUMAN 1.25
#define CARRY_STRENGTH_ADD_UNATHI 2.5
#define CARRY_STRENGTH_ADD_PROTEAN 2.5
#define CARRY_STRENGTH_ADD_MOTH_LIGHT 1.25
#define CARRY_STRENGTH_ADD_MOTH_DARK 0
#define CARRY_STRENGTH_ADD_TAJARAN 0
#define CARRY_STRENGTH_ADD_TESHARI 0
#define CARRY_STRENGTH_ADD_XENOCHIMERA 2.5
#define CARRY_STRENGTH_ADD_XENOHYBRID 2.5

//? Carry factor - multiplier for penalizing over-limit weight; higher is worse.

#define CARRY_FACTOR_BASELINE 1

#define CARRY_FACTOR_MOD_HUMAN 0.92
#define CARRY_FACTOR_MOD_UNATHI 0.92
#define CARRY_FACTOR_MOD_MOTH_LIGHT 0.96
#define CARRY_FACTOR_MOD_MOTH_DARK 1.08
#define CARRY_FACTOR_MOD_TAJARAN 1.08
#define CARRY_FACTOR_MOD_TESHARI 1.12
#define CARRY_FACTOR_MOD_PROTEAN 1.12
#define CARRY_FACTOR_MOD_XENOCHIMERA 0.88
#define CARRY_FACTOR_MOD_XENOHYBRID 0.88

//? Carry equation constants

/// How penalizing the default penalty curve is; lower is weaker slowdowns from overweight.
#define CARRY_WEIGHT_SCALING 2
/// For now, constant - bias factor; higher = skip more of the curve as soon as weight goes above strength
#define CARRY_WEIGHT_BIAS 1.2
/// % from 0 to 1 of the curve that is automatically given ; 0.1 = the asymptote is 10%, as opposed to 0% movespeed
#define CARRY_WEIGHT_ASYMPTOTE 0.1

//? Item Encumbrance defines

#define ITEM_ENCUMBRANCE_BASELINE 0

//* Armor

#define ITEM_ENCUMBRANCE_ARMOR_ULTRALIGHT 7.5
#define ITEM_ENCUMBRANCE_ARMOR_LIGHT 10
#define ITEM_ENCUMBRANCE_ARMOR_MEDIUM 15
#define ITEM_ENCUMBRANCE_ARMOR_HEAVY 20
#define ITEM_ENCUMBRANCE_ARMOR_SUPERHEAVY 30
#define ITEM_ENCUMBRANCE_ARMOR_SPECIALIZED 15

#define ITEM_ENCUMBRANCE_ARMOR_ULTRALIGHT_HELMET 1
#define ITEM_ENCUMBRANCE_ARMOR_LIGHT_HELMET 1.5
#define ITEM_ENCUMBRANCE_ARMOR_MEDIUM_HELMET 2
#define ITEM_ENCUMBRANCE_ARMOR_HEAVY_HELMET 2.5
#define ITEM_ENCUMBRANCE_ARMOR_SUPERHEAVY_HELMET 3
#define ITEM_ENCUMBRANCE_ARMOR_SPECIALIZED_HELMET 2

#define ITEM_ENCUMBRANCE_ARMOR_ULTRALIGHT_GLOVES 1
#define ITEM_ENCUMBRANCE_ARMOR_LIGHT_GLOVES 2
#define ITEM_ENCUMBRANCE_ARMOR_MEDIUM_GLOVES 3
#define ITEM_ENCUMBRANCE_ARMOR_HEAVY_GLOVES 4
#define ITEM_ENCUMBRANCE_ARMOR_SUPERHEAVY_GLOVES 5
#define ITEM_ENCUMBRANCE_ARMOR_SPECIALIZED_GLOVES 3

#define ITEM_ENCUMBRANCE_ARMOR_ULTRALIGHT_BOOTS 2.5
#define ITEM_ENCUMBRANCE_ARMOR_LIGHT_BOOTS 3.5
#define ITEM_ENCUMBRANCE_ARMOR_MEDIUM_BOOTS 5
#define ITEM_ENCUMBRANCE_ARMOR_HEAVY_BOOTS 7.5
#define ITEM_ENCUMBRANCE_ARMOR_SUPERHEAVY_BOOTS 10
#define ITEM_ENCUMBRANCE_ARMOR_SPECIALIZED_BOOTS 5

#define ITEM_ENCUMBRANCE_ARMOR_BIORAD_SUIT 30
#define ITEM_ENCUMBRANCE_ARMOR_BIORAD_HELMET 0
#define ITEM_ENCUMBRANCE_ARMOR_BOMB_SUIT 30
#define ITEM_ENCUMBRANCE_ARMOR_BOMB_HELMET 0
#define ITEM_ENCUMBRANCE_ARMOR_FIRE_SUIT 30
#define ITEM_ENCUMBRANCE_ARMOR_FIRE_HELMET 0

#define ITEM_ENCUMBRANCE_ARMOR_MEDIEVAL_PLATE 30
#define ITEM_ENCUMBRANCE_ARMOR_MEDIEVAL_CHAIN 25

#define ITEM_ENCUMBRANCE_ARMOR_ANOMALY 30
#define ITEM_ENCUMBRANCE_ARMOR_ANOMALY_HELMET 0

//* Clothing

/// shoecuffs
#define ITEM_ENCUMBRANCE_SHOES_CUFFED 50
/// magboots off
#define ITEM_ENCUMBRANCE_SHOES_MAGBOOTS 5
/// normal magboots on
#define ITEM_ENCUMBRANCE_SHOES_MAGBOOTS_PULSE 20
/// ce magboots on
#define ITEM_ENCUMBRANCE_SHOES_MAGBOOTS_PULSE_ADVANCED 7.5
#define ITEM_ENCUMBRANCE_SHOES_CLOWN 5
#define ITEM_ENCUMBRANCE_SHOES_FINS 5
#define ITEM_ENCUMBRANCE_SHOES_GALOSHES 5

//* Factions

#define ITEM_ENCUMBRANCE_CHANGELING_MAGBOOTS 5
#define ITEM_ENCUMBRANCE_CHANGELING_MAGBOOTS_PULSE 7.5
#define ITEM_ENCUMBRANCE_CULT_VOIDSUIT 35
#define ITEM_ENCUMBRANCE_CULT_VOIDSUIT_HELMET 2.5

//* Spacesuits

#define ITEM_ENCUMBRANCE_SOFTSUIT 30
#define ITEM_ENCUMBRANCE_SOFTSUIT_HELMET 2.5

#define ITEM_ENCUMBRANCE_VOIDSUIT 30
#define ITEM_ENCUMBRANCE_VOIDSUIT_HELMET 0
#define ITEM_ENCUMBRANCE_VOIDSUIT_LIGHT 25
#define ITEM_ENCUMBRANCE_VOIDSUIT_HELMET_LIGHT 0
#define ITEM_ENCUMBRANCE_VOIDSUIT_HEAVY 35
#define ITEM_ENCUMBRANCE_VOIDSUIT_HELMET_HEAVY 0
#define ITEM_ENCUMBRANCE_VOIDSUIT_ULTRALIGHT 20
#define ITEM_ENCUMBRANCE_VOIDSUIT_HELMET_ULTRALIGHT 0

#define ITEM_ENCUMBRANCE_VOIDSUIT_ANOMALY 30
#define ITEM_ENCUMBRANCE_VOIDSUIT_ANOMALY_HELMET 2.5

#define ITEM_ENCUMBRANCE_LEGACY_RIG_LIGHT 17.5
#define ITEM_ENCUMBRANCE_LEGACY_RIG 25
#define ITEM_ENCUMBRANCE_LEGACY_RIG_HEAVY 35

#define ITEM_ENCUMBRANCE_EMERGENCY_SOFTSUIT 30
#define ITEM_ENCUMBRANCE_EMERGENCY_SOFTSUIT_HELMET 0

//* Storage

#define ITEM_ENCUMBRANCE_STORAGE_BACKPACK 5
#define ITEM_ENCUMBRANCE_STORAGE_DUFFLEBAG 5
#define ITEM_ENCUMBRANCE_STORAGE_POUCH_LARGE 5

//* Species

#define ITEM_ENCUMBRANCE_PHORONOID_SUIT 20
#define ITEM_ENCUMBRANCE_PHORONOID_HELMET 0
#define ITEM_ENCUMBRANCE_TAJARAN_SWORDSMAN_ARMOR 20

//* Weapons

#define ITEM_ENCUMBRANCE_GUN_LIGHT 2.5
#define ITEM_ENCUMBRANCE_GUN_NORMAL 5
#define ITEM_ENCUMBRANCE_GUN_LARGE 7.5
#define ITEM_ENCUMBRANCE_GUN_BULKY 12.5
#define ITEM_ENCUMBRANCE_GUN_UNREASONABLE 17.5
#define ITEM_ENCUMBRANCE_GUN_RIDICULOUS 30
#define ITEM_ENCUMBRANCE_GUN_VEHICLE 60

#define ITEM_ENCUMBRANCE_MELEE_SPEAR 15
#define ITEM_ENCUMBRANCE_MELEE_SLEDGEHAMMER 20

#define ITEM_ENCUMBRANCE_SHIELD_TOWER 30

//? Item Flat Encumbrance defines

#define ITEM_FLAT_ENCUMBRANCE_DUFFLEBAG 30
#define ITEM_FLAT_ENCUMBRANCE_GALOSHES 30
#define ITEM_FLAT_ENCUMBRANCE_SHOES_CLOWN 30
#define ITEM_FLAT_ENCUMBRANCE_SHOES_FINS 30

//? Item Weight defines

#define ITEM_WEIGHT_BASELINE 0

//* Armor

#define ITEM_WEIGHT_ARMOR_ULTRALIGHT 0
#define ITEM_WEIGHT_ARMOR_LIGHT 0
#define ITEM_WEIGHT_ARMOR_MEDIUM 0
#define ITEM_WEIGHT_ARMOR_HEAVY 0
#define ITEM_WEIGHT_ARMOR_SUPERHEAVY 0
#define ITEM_WEIGHT_ARMOR_SPECIALIZED 0

#define ITEM_WEIGHT_ARMOR_ULTRALIGHT_HELMET 0
#define ITEM_WEIGHT_ARMOR_LIGHT_HELMET 0
#define ITEM_WEIGHT_ARMOR_MEDIUM_HELMET 0
#define ITEM_WEIGHT_ARMOR_HEAVY_HELMET 0
#define ITEM_WEIGHT_ARMOR_SUPERHEAVY_HELMET 0
#define ITEM_WEIGHT_ARMOR_SPECIALIZED_HELMET 0

#define ITEM_WEIGHT_ARMOR_ULTRALIGHT_GLOVES 0
#define ITEM_WEIGHT_ARMOR_LIGHT_GLOVES 0
#define ITEM_WEIGHT_ARMOR_MEDIUM_GLOVES 0
#define ITEM_WEIGHT_ARMOR_HEAVY_GLOVES 0
#define ITEM_WEIGHT_ARMOR_SUPERHEAVY_GLOVES 0
#define ITEM_WEIGHT_ARMOR_SPECIALIZED_GLOVES 0

#define ITEM_WEIGHT_ARMOR_ULTRALIGHT_BOOTS 0
#define ITEM_WEIGHT_ARMOR_LIGHT_BOOTS 0
#define ITEM_WEIGHT_ARMOR_MEDIUM_BOOTS 0
#define ITEM_WEIGHT_ARMOR_HEAVY_BOOTS 0
#define ITEM_WEIGHT_ARMOR_SUPERHEAVY_BOOTS 0
#define ITEM_WEIGHT_ARMOR_SPECIALIZED_BOOTS 0

#define ITEM_WEIGHT_ARMOR_BIORAD_SUIT 0
#define ITEM_WEIGHT_ARMOR_BIORAD_SUIT_HELMET 0
#define ITEM_WEIGHT_ARMOR_BOMB_SUIT 0
#define ITEM_WEIGHT_ARMOR_BOMB_HELMET 0
#define ITEM_WEIGHT_ARMOR_FIRE_SUIT 0
#define ITEM_WEIGHT_ARMOR_FIRE_SUIT_HELMET 0

#define ITEM_WEIGHT_ARMOR_MEDIEVAL_PLATE 0
#define ITEM_WEIGHT_ARMOR_MEDIEVAL_CHAIN 0

#define ITEM_WEIGHT_ARMOR_ANOMALY 0
#define ITEM_WEIGHT_ARMOR_ANOMALY_HELMET 0

//* Clothing

//* Items

#define ITEM_WEIGHT_GAS_TANK 0
#define ITEM_WEIGHT_VEHICLE_FRAME 0

//* Spacesuits / RIGs

#define ITEM_WEIGHT_SOFTSUIT 0
#define ITEM_WEIGHT_SOFTSUIT_HELMET 0

#define ITEM_WEIGHT_VOIDSUIT 0
#define ITEM_WEIGHT_VOIDSUIT_HELMET 0
#define ITEM_WEIGHT_VOIDSUIT_LIGHT 0
#define ITEM_WEIGHT_VOIDSUIT_HELMET_LIGHT 0
#define ITEM_WEIGHT_VOIDSUIT_HEAVY 0
#define ITEM_WEIGHT_VOIDSUIT_HELMET_HEAVY 0
#define ITEM_WEIGHT_VOIDSUIT_ULTRALIGHT 0
#define ITEM_WEIGHT_VOIDSUIT_HELMET_ULTRALIGHT 0

#define ITEM_WEIGHT_VOIDSUIT_ANOMALY 0
#define ITEM_WEIGHT_VOIDSUIT_ANOMALY_HELMET 0

#define ITEM_WEIGHT_LEGACY_RIG_LIGHT 0
#define ITEM_WEIGHT_LEGACY_RIG 0
#define ITEM_WEIGHT_LEGACY_RIG_HEAVY 0

#define ITEM_WEIGHT_EMERGENCY_SOFTSUIT 0
#define ITEM_WEIGHT_EMERGENCY_SOFTSUIT_HELMET 0

//* Species

#define ITEM_WEIGHT_TAJARAN_SWORDSMAN_ARMOR 0
#define ITEM_WEIGHT_PHORONOID_SUIT 0
#define ITEM_WEIGHT_PHORONOID_HELMET 0

//* Storage

#define ITEM_WEIGHT_STORAGE_DUFFLEBAG 0
#define ITEM_WEIGHT_STORAGE_BACKPACK 0
#define ITEM_WEIGHT_STORAGE_POUCH_LARGE 0

//* Tools

#define ITEM_WEIGHT_HYBRID_TOOLS 0

//* Weapons

#define ITEM_WEIGHT_GUN_LIGHT 0
#define ITEM_WEIGHT_GUN_NORMAL 0
#define ITEM_WEIGHT_GUN_LARGE 0
#define ITEM_WEIGHT_GUN_BULKY 0
#define ITEM_WEIGHT_GUN_UNREASONABLE 0
#define ITEM_WEIGHT_GUN_RIDICULOUS 0
#define ITEM_WEIGHT_GUN_VEHICLE 0

#define ITEM_WEIGHT_MELEE_SPEAR 0

//* Antags

#define ITEM_WEIGHT_CHANGELING_ARMOR 0
#define ITEM_WEIGHT_CULT_VOIDSUIT_HELMET 0
#define ITEM_WEIGHT_CULT_VOIDSUIT 0
#define ITEM_WEIGHT_TECHNOMANCER_BULKY_CORE 0
