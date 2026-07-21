// Emerald Summit port — defines needed by ported content

#define DRUGRADE_MONEYA				(1<<0)
#define DRUGRADE_MONEYB 	      	(1<<1)
#define DRUGRADE_NOTAX				(1<<5)

#define DEFAULT_GARRISON_COLOR "#FF4242"
#define GARRISON_CROWN_COLOR "#C2A245"
#define SCOM_TARGET_COMMONS 0
#define SCOM_TARGET_GARRISON 1
#define SCOM_TARGET_MATTHIOS 2
#define SCOM_TARGET_INQUISITOR 3
#define SCOM_TARGET_LOUDMOUTH 4
#define SCOM_TARGET_JABBERLINE 5
#define SCOM_TARGET_LOUDMOUTH_STRONG 6

#define TAIL_LAMIA	(1<<20)

#define ARMOR_LEATHER_STUDDED list("blunt" = 80, "slash" = 80, "stab" = 60, "piercing" = 20, "fire" = 0, "magic" = 0)
#define ARMOR_CUIRASS list("blunt" = 40, "slash" = 100, "stab" = 80, "piercing" = 60, "fire" = 0, "magic" = 0)
#define ARMOR_HEAD_BAD list("blunt" = 50, "slash" = 20, "stab" = 30, "piercing" = 10, "fire" = 0, "magic" = 0)

#define ROCK_CHARGE_REDUCTION 0.15
#define GEM_CHARGE_REDUCTION 0.25
#define RIDDLE_OF_STEEL_CAST_TIME_REDUCTION 0.4

#define CLOTHING_COLOR_NAMES	list("Red","Purple","Black","Brown","Green","Blue","Yellow","Teal","White","Orange","Magenta")

/proc/clothing_color2hex(input)
	switch(input)
		if("Red")
			return CLOTHING_RED
		if("Scarlet")
			return CLOTHING_SCARLET
		if("Purple")
			return CLOTHING_PURPLE
		if("Black")
			return CLOTHING_BLACK
		if("Brown")
			return CLOTHING_BROWN
		if("Green")
			return CLOTHING_GREEN
		if("Blue")
			return CLOTHING_BLUE
		if("Yellow")
			return CLOTHING_YELLOW
		if("Teal")
			return CLOTHING_TEAL
		if("Azure")
			return CLOTHING_AZURE
		if("White")
			return CLOTHING_WHITE
		if("Orange")
			return CLOTHING_ORANGE
		if("Magenta")
			return CLOTHING_MAGENTA
