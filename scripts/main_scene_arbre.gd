extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false
	$Label2.visible = false
var used_card = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if $card.position == $snap_area.position && $card2.position == $snap_area2.position:
		print("all good")


func _on_card_used() -> void: #c'est un peu moche les if elif comme ca mais bon, ca marche
	$Label.visible = true
	$Label2.visible = false



func _on_card_2_used() -> void:
	$Label.visible = false
	$Label2.visible = true
