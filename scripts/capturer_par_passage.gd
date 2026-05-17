extends Area2D
@export var cartes :String
const PROBA = 0.1
var rng = RandomNumberGenerator.new()

signal on_capture(card)
signal on_capture_label(card)


func _on_body_entered(body: Node2D) -> void: # Pour actualiser, avec une proba une des cartes de la zone si on passe sur le collisionshape2D
	var cartes = global.zones[cartes]
	if rng.randf() <= PROBA:
		var randn = rng.randi_range(0, len(global.zones[cartes]) - 1)
		while not (global.possessed_card[cartes[randn]][0] and global.possessed_card[cartes[randn]][1]): # on veut que la carte n'ai jamais été déocouverte
			if global.possessed_card[cartes[randn]][0]: # si la carte à été trouvée, on actualise le label
				global.possessed_card[cartes[randn]][1] = true
				on_capture_label.emit(cartes[randn])
			else:
				global.possessed_card[cartes[randn]][0] = true # si la carte n'a pas été trouvée, on rajoute la carte
				on_capture.emit(cartes[randn])
			randn = rng.randi_range(0, len(global.zones[cartes]) - 1)
