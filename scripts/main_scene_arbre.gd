extends Node2D

@onready var snap_association = {
	$snapcards/rouge_grp1/snap_area: [], # faire de meme avec tous, dans la liste, mettre toutes les cartes qui peuvent aller sur cette emplacement
	$snapcards/rouge_grp1/snap_area2: [],
	
	
	
	$snapcards/vert_fonce_grp2/snap_area: [],
	$snapcards/vert_fonce_grp2/snap_area2: [],
	
	
	
	$snapcards/beige_grp3/snap_area: [],
	$snapcards/beige_grp3/snap_area2: [],
	
	
	
	$snapcards/rose_grp4/snap_area: [],
	$snapcards/rose_grp4/snap_area2: [],
	$snapcards/rose_grp4/snap_area3: [],
	
	
	
	$snapcards/orange_grp5/snap_area: [],
	$snapcards/orange_grp5/snap_area2: [],
	$snapcards/orange_grp5/snap_area3: [],
	
	
	
	$snapcards/vert_clair_grp6/snap_area: [],
	$snapcards/vert_clair_grp6/snap_area2: [],
	$snapcards/vert_clair_grp6/snap_area3: [],
	
	
	
	$snapcards/vert_moyen_grp7/snap_area: [],
	$snapcards/vert_moyen_grp7/snap_area2: [],
	
	
	
	$snapcards/bleu_clair_grp8/snap_area: [],
	$snapcards/bleu_clair_grp8/snap_area2: [],
	
	
	
	$snapcards/turquoise_grp9/snap_area: [],
	$snapcards/turquoise_grp9/snap_area2: [],
	
	
	
	$snapcards/bleu_fonce_grp10/snap_area: [],
	$snapcards/bleu_fonce_grp10/snap_area2: [],
	
	
	
	$snapcards/bordeaux_grp11/snap_area: [],
	$snapcards/bordeaux_grp11/snap_area2: [],
	


	$snapcards/autres/snap_area: [],
	$snapcards/autres/snap_area1: [],
	$snapcards/autres/snap_area2: [],
	$snapcards/autres/snap_area3: [],
	$snapcards/autres/snap_area4: [],

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
		card.visible = global.possessed_card[card.name][0]


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
