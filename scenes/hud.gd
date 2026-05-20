extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false
	$bulle.visible = false
	for place in get_tree().get_nodes_in_group("capture_places"): # connecter à tout les nodes
		place.capture.connect(on_capture)
	for bush in get_tree().get_nodes_in_group("bushes"):
		bush.on_capture.connect(on_capture)
		bush.on_capture_label.connect(on_capture_label)


func on_capture(card):
	$Timer.start()
	$Label.visible = true
	$bulle.visible = true
	$Label.text = "Tu as débloqué le/la " + card


func _on_timer_timeout() -> void:
	$Label.visible = false
	$bulle.visible = false


func on_capture_label(card):
	$Timer.start()
	$Label.visible = true
	$bulle.visible = true
	$Label.text = "Tu as trouvé plus d'informations sur le/la" + card
