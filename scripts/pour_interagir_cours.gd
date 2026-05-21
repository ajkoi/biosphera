extends Area2D
@export var cours :String
@export var is_disabled = false
signal lancer_cours(cours)
signal dis(node)
var is_interagible = false




func _input(event: InputEvent) -> void:
	if event.is_action_released("interact") and is_interagible and not is_disabled:
		if cours == "histoire":
			is_disabled = true
			dis.emit($".")
		lancer_cours.emit(cours)
	



func _on_body_entered(body: Node2D) -> void:
	if "player" in body.get_groups():
		is_interagible = true
	else:
		pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if "player" in body.get_groups():
		is_interagible = false
