extends Node2D
@onready var canvas_layer = $Inventory
const INVENTORY_SCENE = preload("res://scenes/menu_arbre/main_scene_arbre.tscn")
var inventory_instance = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("inventaire"):
		print("inv")
		print(inventory_instance!=null)
		if inventory_instance!=null:
			_close_inventory()
		else:
			_open_inventory()
func _open_inventory() -> void:
	inventory_instance = INVENTORY_SCENE.instantiate()
	canvas_layer.add_child(inventory_instance)
	var cards = inventory_instance.get_cards()
	print(cards[0].position)
	for card in cards:
		if card.name in global.cards_pos.keys():
			print(global.cards_pos[card.name])
			card.position = global.cards_pos[card.name]

	$gamenode.process_mode = Node.PROCESS_MODE_DISABLED # pauser le reste du jeu


func _close_inventory() -> void:
	if inventory_instance:
		var cards = inventory_instance.get_cards()
		for card in cards:
			global.cards_pos[card.name] = card.position
		print(global.cards_pos)
		inventory_instance.queue_free()
		inventory_instance = null
		$gamenode.process_mode = Node.PROCESS_MODE_INHERIT # pauser le reste du jeu

func _on_interagible_lancer_cours(cours: Variant) -> void:
	var cours_path = preload("res://scenes/menu_explication/explications.tscn")
	var cours_instance = cours_path.instantiate()
	cours_instance.path = global.path_cours[cours][0]
	cours_instance.path_quizz = global.path_cours[cours][1]
	$cours_subscene.add_child(cours_instance)
	
	$gamenode.process_mode = Node.PROCESS_MODE_DISABLED # pauser le reste du jeu
