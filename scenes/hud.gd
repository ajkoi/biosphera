extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$touche_A.text = ""
	$Label.visible = false
	$bulle.visible = false
	call_deferred("connect_sign")

	

func connect_sign():
	for place in get_tree().get_nodes_in_group("capture_places"): # connecter à tout les nodes
		place.capture.connect(on_capture)
	for bush in get_tree().get_nodes_in_group("bushes"):
		bush.on_capture.connect(on_capture)
		bush.on_capture_label.connect(on_capture_label)
	for interact in get_tree().get_nodes_in_group("interagibles"):
		interact.body_entered.connect(body_enter)
		interact.body_exited.connect(body_exit)
func on_capture(card):
	$Timer.start()
	$Label.visible = true
	$bulle.visible = true
	$Label.text = "Tu as débloqué le/la " + card

func body_enter(body):
	print(body)
	$touche_A.text = "[img=64x64]res://assets/touches/touche_A.png[/img] Interagir"
	
func body_exit(_body):
	$touche_A.text = ""
	
	
func _on_timer_timeout() -> void:
	$Label.visible = false
	$bulle.visible = false


func on_capture_label(card):
	$Timer.start()
	$Label.visible = true
	$bulle.visible = true
	$Label.text = "Tu as trouvé plus d'informations sur le/la" + card
