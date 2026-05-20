extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false
	$bulle.visible = false
	for place in get_tree().get_nodes_in_group("capture_places"):
		place.capture.connect(on_capture)



func on_capture(card):
	$Timer.start()
	$Label.visible = true
	$bulle.visible = true
	$Label.text = "Tu as eu la carte de" + card
	global.possessed_card[card] = true


func _on_timer_timeout() -> void:
	$Label.visible = false
	$bulle.visible = false
