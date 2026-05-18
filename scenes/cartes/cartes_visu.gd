extends Control
@onready var cards = get_tree().get_nodes_in_group("cards")
@onready var lenca = len(cards)
var ptr = 0

func _on_back_pressed() -> void:
	ptr -= 1
	ptr %= lenca
	for i in cards:
		i.visible = false

	if global.possessed_card[cards[ptr].name][1]:
		cards[ptr].visible = true
		




func _on_forw_pressed() -> void:
	ptr += 1
	ptr %= lenca
	for i in cards:
		i.visible = false
	while !global.possessed_card[cards[ptr].name][1]:
		ptr += 1
		ptr %= lenca
		if global.possessed_card[cards[ptr].name][1]:
			cards[ptr].visible = true
		
