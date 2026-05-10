extends Area2D


var is_interagible = false
@export var card : String
signal capture(card : String)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_interagible and Input.is_action_just_pressed("interact"):
		print("interagi") # DIRE QUE ON A CHOPPE LA CARTE
		capture.emit(card)


func _on_body_entered(body: Node2D) -> void:
	if "player" in body.get_groups():
		is_interagible = true
	else:
		pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if "player" in body.get_groups():
		is_interagible = false
