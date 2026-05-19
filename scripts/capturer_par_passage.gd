extends Area2D
@export var zone :String
const PROBA = 0.5
var rng = RandomNumberGenerator.new()
@onready var lendoc = len(global.zones[zone])
signal on_capture(card)
signal on_capture_label(card)


func _on_body_entered(body: Node2D) -> void: # Pour actualiser, avec une proba une des cartes de la zone si on passe sur le collisionshape2D
	var cartes = global.zones[zone]
	var count = 0
	if global.count_zone[zone] == lendoc:
		return
	if rng.randf() <= PROBA:
		var randn = rng.randi_range(0, len(global.zones[zone]) - 1)
		while  global.possessed_card[cartes[randn]][0] and global.possessed_card[cartes[randn]][1]: # on veut que la carte n'ai jamais été déocouverte
			count += 1
			if count >= lendoc:
				return 
			randn = rng.randi_range(0, len(global.zones[zone]) - 1)
			print("ONE MORE")
		if global.possessed_card[cartes[randn]][0]: # si la carte à été trouvée, on actualise le label
			global.possessed_card[cartes[randn]][1] = true
			on_capture_label.emit(cartes[randn])
			print("capture_lab")
		else:
			global.possessed_card[cartes[randn]][0] = true # si la carte n'a pas été trouvée, on rajoute la carte
			on_capture.emit(cartes[randn])
			global.count_zone[zone] += 1
			print("capture carte")

			
