extends Node2D

signal fin_text

func card_on(snap : Node2D):
	var pos = snap.position
	for i in get_tree().get_nodes_in_group("cards"):
		if pos == i.position:
			return true
	return false




func _on_button_pressed() -> void:
	if card_on($snap_area) && card_on($snap_area2) && $snap_area3.position == $card3.position:
		print("c'est bon :DD")
		fin_text.emit()
		
	else:
		print("essaie encore")
