extends Node2D

@onready var snap_association = {
	$snapcards/rouge_grp1/snap_area: [] # faire de meme avec tous, dans la liste, mettre toutes les cartes qui peuvent aller sur cette emplacement
}

@onready var cards_label = {
	# à completer avec card_preview : card correspondante
}
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
func _on_button_pressed() -> void: # il faut tout check
	var good = 0
	for snap in snap_association.keys():
		for card in snap_association[snap]:
			if snap.position != card.position:
				print("GROS CACA LIQUIDE TU AS FAUX")
			else:
				good += 1
	print(str(good) + "/30")
		




func _on_card_used() -> void: #c'est un peu moche les if elif comme ca mais bon, ca marche
	$CanvasLayer/Label.visible = true
	$CanvasLayer/Label2.visible = false



func _on_card_2_used() -> void:
	$CanvasLayer/Label.visible = false
	$CanvasLayer/Label2.visible = true


func _on_card_node_exit(node: Node2D, dif: Vector2) -> void:
	node.reparent($".")
	node.position = get_global_mouse_position() + dif
