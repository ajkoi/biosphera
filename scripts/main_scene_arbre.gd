extends Node2D

@onready var cards = get_tree().get_nodes_in_group("cards")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/Label.visible = false
	$CanvasLayer/Label2.visible = false
	for card in cards:
		card.visible = global.possessed_card[card.name]


var used_card = ""

func get_cards():
	return get_tree().get_nodes_in_group("cards")
func _on_button_pressed() -> void:
	if $card1.position == $snap_area.position && $card2.position == $snap_area2.position:
		print("allvar player_pos = Vector2(0,0) good")


func _on_card_used() -> void: #c'est un peu moche les if elif comme ca mais bon, ca marche
	$CanvasLayer/Label.visible = true
	$CanvasLayer/Label2.visible = false



func _on_card_2_used() -> void:
	$CanvasLayer/Label.visible = false
	$CanvasLayer/Label2.visible = true
