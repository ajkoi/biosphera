extends Node2D
# inventaire (arbre)
@onready var Inventaire_node = $Inventory
@onready var card_node = $cards
const INVENTORY_SCENE = preload("res://scenes/menu_arbre/main_scene_arbre.tscn")
var inventory_instance :Node2D = null

const CARD_SCENE = preload("res://scenes/cartes/cartes_visu.tscn")
var CARDS_instance  = null


var index_hist = 0
# relatif aux quizz (path et instance actuelle)
const text_hist =["Pendant longtemps, le fixisme dominait, affirmant que les espèces étaient immuables et créées telles quelles, souvent dans une vision liée à la religion, tandis que la “scala naturae”, héritée d’Aristote, classait les êtres vivants de manière hiérarchique sans envisager de transformation. Au XVIIᵉ siècle, des scientifiques comme Edward Tyson commencent à comparer rigoureusement les organismes, posant les bases de l’anatomie comparée.",
"Au XVIIIᵉ siècle, le transformisme de Lamarck introduit l’idée que les espèces changent au cours du temps sous l’influence de leur environnement. L’anatomie comparée est ensuite structurée au XIXᵉ siècle par Georges Cuvier, bien qu’il reste attaché au fixisme et développe le catastrophisme, théorie selon laquelle les espèces disparaissent brutalement à la suite de catastrophes naturelles, puis sont remplacées par de nouvelles espèces apparues après ces événements, sans transformation progressive des espèces existantes. Les notions d’homologie et d’analogie, notamment introduites par Richard Owen, permettent alors de mieux interpréter les ressemblances entre espèces.",
"La théorie de l’évolution par sélection naturelle de Charles Darwin marque une rupture majeure en expliquant que les espèces descendent d’ancêtres communs et évoluent progressivement. Au XXᵉ siècle, la théorie synthétique de l’évolution complète cette vision en intégrant la génétique, tandis que la phylogénie permet de reconstituer les relations de parenté sous forme d’arbres évolutifs. Aujourd’hui, l’anatomie comparée, enrichie par la biologie moléculaire et la paléontologie, est un outil essentiel pour comprendre l’évolution et la diversité du vivant."]

const COURS_SCENE = preload("res://scenes/menu_explication/explications.tscn")
const QUIZZ_SCENE = preload("res://scenes/menu_quizz/quizz.tscn")

var index = 0
var cours_quizz_paths = []
var current_instance = null



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("inventaire"):
		if CARDS_instance != null:
			_close_cards()
		if inventory_instance != null:
			_close_inventory()
		else:
			_open_inventory()
	if event.is_action_released("cartes"):
		if inventory_instance != null:
			_close_inventory()
		if CARDS_instance != null:
			_close_cards()
		else:
			_open_cards()
		
		
		
func _open_cards():
	CARDS_instance = CARD_SCENE.instantiate()
	card_node.add_child(CARDS_instance)
	$gamenode/Player/Camera2D.enabled = false
	$HUD.visible = false
	$gamenode.process_mode = Node.PROCESS_MODE_DISABLED # pauser le reste du jeu

func _close_cards():
	if CARDS_instance:
		CARDS_instance.queue_free()
		CARDS_instance = null 
		$gamenode/Player/Camera2D.enabled = true
		$HUD.visible = true
		$gamenode.process_mode = Node.PROCESS_MODE_INHERIT # dépauser pauser le reste du jeu
	
func _open_inventory() -> void:
	$HUD.visible = false

	inventory_instance =  INVENTORY_SCENE.instantiate()
	Inventaire_node.add_child(inventory_instance)
	var cards = inventory_instance.get_cards()
	for card :Node2D in cards:
		if card.name in global.cards_pos.keys():
			if global.cards_pos[card.name][1]:
				card.reparent(inventory_instance.get_node("cards"))
				card.scale_exit()
			card.position = global.cards_pos[card.name][0]
			
	$gamenode/Player/Camera2D.enabled = false
	$gamenode.process_mode = Node.PROCESS_MODE_DISABLED # pauser le reste du jeu


func _close_inventory() -> void:
	$HUD.visible = true
	if inventory_instance:
		var cards = inventory_instance.get_cards()
		for card in cards:
			global.cards_pos[card.name] = [card.position, card.get_parent().get_parent().name != "CanvasLayer"]
		inventory_instance.queue_free()
		inventory_instance = null
		$gamenode/Player/Camera2D.enabled = true

		$gamenode.process_mode = Node.PROCESS_MODE_INHERIT # dépauser pauser le reste du jeu

func _on_interagible_lancer_cours(cours: Variant) -> void:
	if cours == "histoire":
		hist()
		$gamenode.process_mode = Node.PROCESS_MODE_DISABLED # pauser le reste du jeu

		return
	elif cours == "credits":
		credits()
		return
	var cours_instance = COURS_SCENE.instantiate()
	cours_quizz_paths = File_utils.get_dirs(global.path_cours[cours])
	cours_instance.path = cours_quizz_paths[0]
	if cours == "cours_prairie":
		cours_quizz_paths = ["",load("res://cours/Prairie_debut_1/prairie/Q1/quizz_prairie.tscn"), load("res://cours/Prairie_debut_1/prairie/Q2/quizz_prairie.tscn"), load("res://cours/Prairie_debut_1/prairie/Q3/quizz_prairie.tscn")]
		cours_instance.fin_text.connect(_on_next_quizz_prairie, CONNECT_ONE_SHOT)

	else:
		cours_instance.fin_text.connect(_on_next_quizz, CONNECT_ONE_SHOT)
	current_instance = cours_instance
	$cours_subscene.add_child(cours_instance)
	$gamenode.process_mode = Node.PROCESS_MODE_DISABLED # pauser le reste du jeu

func credits():
	$credits.visible = true
	
	var text = File_utils.load_text("res://creditbis.txt")
	if text == null:
		text = File_utils.load_text("res://CREDIT.md")
	$credits/RichTextLabel.text = text
	while not Input.is_action_just_pressed("dash"):
		await get_tree().process_frame # attendre la frame suivante
	$credits.visible = true
	$gamenode.process_mode = Node.PROCESS_MODE_INHERIT # dépauser pauser le reste du jeu



func hist():
	if index_hist>3:
		return
	else:
		$maisons.visible = true
		$maisons/RichTextLabel2.text = str(index_hist + 1) + "/3"
		$maisons/RichTextLabel.text = text_hist[index_hist]
		while not Input.is_action_just_pressed("dash"):
			await get_tree().process_frame # attendre la frame suivante
		$maisons.visible = false
		index_hist += 1
		$gamenode.process_mode = Node.PROCESS_MODE_INHERIT # dépauser pauser le reste du jeu

func _on_next_quizz_prairie():

	if current_instance:
		current_instance.queue_free()
		current_instance = null
	if index + 1 < len(cours_quizz_paths):
		index += 1
		var scene_quizz_inst = cours_quizz_paths[index].instantiate()
		current_instance = scene_quizz_inst
		$cours_subscene.add_child(scene_quizz_inst)
		scene_quizz_inst.fin_text.connect(_on_next_quizz_prairie, CONNECT_ONE_SHOT)

	else:
		$gamenode.process_mode = Node.PROCESS_MODE_INHERIT # pauser le reste du jeu
		cours_quizz_paths = []
		index = 0
		if current_instance:
			current_instance.queue_free()
		current_instance = null
		
		
		

func _on_next_quizz():
	if current_instance:
		current_instance.queue_free()
		
	if index + 1 < len(cours_quizz_paths): # index correspond à l'index de la scene actuel, donc on initie la suivante à index+1
		index+=1
		var quizz_instance = QUIZZ_SCENE.instantiate()
		current_instance = quizz_instance
		quizz_instance.doc_path = cours_quizz_paths[index]
		$cours_subscene.add_child(quizz_instance)
		quizz_instance.fin_text.connect(_on_next_quizz, CONNECT_ONE_SHOT)
	else:
		$gamenode.process_mode = Node.PROCESS_MODE_INHERIT # pauser le reste du jeu
		cours_quizz_paths = []
		index = 0
		current_instance = null
