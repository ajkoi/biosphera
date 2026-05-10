extends Node2D
@onready var canvas_layer = $Inventory
const INVENTORY_SCENE = preload("res://scenes/menu_arbre/main_scene_arbre.tscn")
var inventory_instance = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
