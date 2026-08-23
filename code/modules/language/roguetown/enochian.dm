/datum/language/enochian
	name = "Enochian"
	desc = "The language of the celestial realm."
	speech_verb = "resonates"
	ask_verb = "inquires"
	exclaim_verb = "proclaims"
	whisper_verb = "whispers"
	key = "f"
	space_chance = 5
	default_priority = 100
	icon_state = "celestial"
	spans = list(SPAN_ENOCHIAN)
	syllables = list(
		"★", "☆", "♥", "☜", "☞", "☎", "☏",
		"►", "◄", "▧", "▨", "♨", "◐", "◑", "↔", "↕", "▪", "▫", "☼", "♦",
		"◊", "♠", "♣", "▣", "▤", "▥", "▦", "▩", "◘", "◙",
		"◈", "♫", "♬", "♪", "♩", "♭", "の", "→", "あ", "ぃ", "￡", "❤", "＃", "＠", "＆", "＊",
		"❁", "❀", "✿", "✾", "❃", "✺", "❇", "❈", "❊", "❉", "✱", "✲", "✩", "✫", "✬", "✭",
		"✮", "✰", "✪", "☀", "☽", "☾", "ღ", "❂", "◕", "⊕", "☉", "Θ", "o", "O", "☯",
		"㊝", "☂", "×", "÷", "＝", "≠", "≒", "∞", "±", "√", "⊥", "▶", "▷", "◁",
		"☁", "☃", "☄", "☇", "☈", "☊", "☋", "☌", "☍", "☑", "☒", "☢", "☸", "☹", "♢", "♤",
		"♧", "✙", "✈", "✉", "✁", "♝", "♞", "♯", "♮", "☪","₪", "♂", "↑", "↓",
		"←", "↖", "↗", "↙", "↘", "㊣", "○", "△", "▲", "◇", "◆", "■", "□", "▽", "▼", "§", "￥",
		"〒", "￠", "※", "♀", "⁂", "ↂ", "✐", "✡", "✓", "✔", "✕", "✖", "✄", "☣", "☠", "☭",
		"➳", "➽","✚", "✣", "✤", "✥", "✦", "❥", "❦", "❧", "➸", "큐", "«", "»", "凸", "❆",
	)

/datum/language/enochian/scramble(input)
	var/lookup = check_cache(input)
	if(lookup)
		return lookup

	var/input_size = length_char(input)
	var/scrambled_text = ""

	while(length_char(scrambled_text) < input_size)
		scrambled_text += pick(syllables)
		var/chance = rand(100)
		if(chance <= sentence_chance)
			scrambled_text += ". "
		else if(chance > sentence_chance && chance <= space_chance)
			scrambled_text += " "

	scrambled_text = trim(scrambled_text)
	if(copytext_char(scrambled_text, -1) == ".")
		scrambled_text = copytext_char(scrambled_text, 1, -1)
	var/input_ending = copytext_char(input, -1)
	if(input_ending in list("!","?","."))
		scrambled_text += input_ending

	add_to_cache(input, scrambled_text)
	return scrambled_text
