extends Area2D

const next_scene = preload("res://scenes/menu_arbre/main_scene_arbre.tscn")
func _on_body_entered(body: Node2D) -> void:
	if "player" in body.get_groups():		
		get_tree().change_scene_to_packed.bind(next_scene).call_deferred()
