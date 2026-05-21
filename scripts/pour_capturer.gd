extends Area2D

var rng = RandomNumberGenerator.new()
@onready var lendoc = len(global.zones["fossile"])

var is_interagible = false
signal capture(card : String)
signal capture_lab(lab: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and is_interagible==true:
		var cartes = global.zones["fossile"]
		var count = 0
		var carte_exam = null
		if global.count_zone["fossile"] == lendoc:
			return
		var randn = rng.randi_range(0, len(global.zones["fossile"]) - 1)
		carte_exam = cartes[randn]
		
		while global.possessed_card[cartes[randn]][0] and global.possessed_card[cartes[randn]][1]: # on veut que la carte n'ai jamais été déocouverte
			count += 1
			if count >= lendoc:
				return 
			randn = rng.randi_range(0, len(global.zones["fossile"]) - 1)
			carte_exam = cartes[randn]
		if global.possessed_card[carte_exam][0]: # si la carte à été trouvée, on actualise le label
			global.possessed_card[carte_exam][1] = true
			capture_lab.emit(carte_exam)
			for zones in global.card_zones[carte_exam].keys():
				global.count_zone[zones] += 1
				#print(global.count_zone())

		else:
			global.possessed_card[carte_exam][0] = true # si la carte n'a pas été trouvée, on rajoute la carte
			capture.emit(carte_exam)

func _on_body_entered(body: Node2D) -> void:
	if "player" in body.get_groups():
		is_interagible = true
	else:
		pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if "player" in body.get_groups():
		is_interagible = false
