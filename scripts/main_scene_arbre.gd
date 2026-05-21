extends Node2D

@onready var snap_association = {
	$snapcards/rouge_grp1/snap_area: [$cards/pigeon, $CanvasLayer/cards/poule], # faire de meme avec tous, dans la liste, mettre toutes les cartes qui peuvent aller sur cette emplacement
	$snapcards/rouge_grp1/snap_area2: [$cards/pigeon, $CanvasLayer/cards/poule],
	
	
	
	$snapcards/vert_fonce_grp2/snap_area: [$cards/trex, $CanvasLayer/cards/archaeopteryx],
	$snapcards/vert_fonce_grp2/snap_area2: [$cards/trex, $CanvasLayer/cards/archaeopteryx],
	
	
	
	$snapcards/beige_grp3/snap_area: [$CanvasLayer/cards/croco, $CanvasLayer/cards/pteranodon],
	$snapcards/beige_grp3/snap_area2: [$CanvasLayer/cards/croco, $CanvasLayer/cards/pteranodon],
	
	
	
	$snapcards/rose_grp4/snap_area: [$CanvasLayer/cards/tigre, $CanvasLayer/cards/chat, $cards/loup],
	$snapcards/rose_grp4/snap_area2: [$CanvasLayer/cards/tigre, $CanvasLayer/cards/chat, $cards/loup],
	$snapcards/rose_grp4/snap_area3: [$CanvasLayer/cards/tigre, $CanvasLayer/cards/chat, $cards/loup],
	
	
	
	$snapcards/orange_grp5/snap_area: [$CanvasLayer/cards/mammouth, $CanvasLayer/cards/elephant, $CanvasLayer/cards/cheval],
	$snapcards/orange_grp5/snap_area2: [$CanvasLayer/cards/mammouth, $CanvasLayer/cards/elephant, $CanvasLayer/cards/cheval],
	$snapcards/orange_grp5/snap_area3: [$CanvasLayer/cards/mammouth, $CanvasLayer/cards/elephant, $CanvasLayer/cards/cheval],
	
	
	
	$snapcards/vert_clair_grp6/snap_area: [$cards/dauphin, $CanvasLayer/cards/ichtyosaure, $CanvasLayer/cards/baleine],
	$snapcards/vert_clair_grp6/snap_area2: [$cards/dauphin, $CanvasLayer/cards/ichtyosaure, $CanvasLayer/cards/baleine],
	$snapcards/vert_clair_grp6/snap_area3: [$cards/dauphin, $CanvasLayer/cards/ichtyosaure, $CanvasLayer/cards/baleine],
	
	
	
	$snapcards/vert_moyen_grp7/snap_area: [$cards/espadon, $CanvasLayer/cards/daurade],
	$snapcards/vert_moyen_grp7/snap_area2: [$cards/espadon, $CanvasLayer/cards/daurade],
	
	
	
	$snapcards/bleu_clair_grp8/snap_area: [$CanvasLayer/cards/thylacine, $CanvasLayer/cards/kangourou],
	$snapcards/bleu_clair_grp8/snap_area2: [$CanvasLayer/cards/thylacine, $CanvasLayer/cards/kangourou],
	
	
	
	$snapcards/turquoise_grp9/snap_area: [$CanvasLayer/cards/boa, $cards/tortue],
	$snapcards/turquoise_grp9/snap_area2: [$CanvasLayer/cards/boa, $cards/tortue],
	
	
	
	$snapcards/bleu_fonce_grp10/snap_area: [$CanvasLayer/cards/coccinelle, $CanvasLayer/cards/fourmi],
	$snapcards/bleu_fonce_grp10/snap_area2: [$CanvasLayer/cards/coccinelle, $CanvasLayer/cards/fourmi],
	
	
	
	$snapcards/bordeaux_grp11/snap_area: [$CanvasLayer/cards/crabe, $cards/homard],
	$snapcards/bordeaux_grp11/snap_area2: [$CanvasLayer/cards/crabe, $cards/homard],
	


	$snapcards/autres/snap_area: [$CanvasLayer/cards/pieuvre],
	$snapcards/autres/snap_area2: [$CanvasLayer/cards/grenouille],
	$snapcards/autres/snap_area3: [$CanvasLayer/cards/chauve_souris],
	$snapcards/autres/snap_area4: [$CanvasLayer/cards/truite],
	$snapcards/autres/snap_area5: [$CanvasLayer/cards/grand_requin],

}

@onready var cards_label = {
	# à completer avec card_preview : card correspondante
}
@onready var cards = get_tree().get_nodes_in_group("cards")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$CanvasLayer/Label.visible = false
	#$CanvasLayer/Label2.visible = false
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
				print(snap, card)

				#print("GROS CACA LIQUIDE TU AS FAUX")
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
	node.reparent($cards)
	node.position = get_global_mouse_position() + dif
