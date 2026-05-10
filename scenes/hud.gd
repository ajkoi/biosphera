extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_capture(card):
	$Timer.start()
	$Label.visible = true
	$Label.text = "Tu as eu la carte" + card
	global.possessed_card[card] = true

func _on_capture_place_capture(card: String) -> void:
	on_capture(card)


func _on_timer_timeout() -> void:
	$Label.visible = false
