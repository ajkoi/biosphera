extends Area2D

# ce script est pour changer de scene mais il ne sert pas a grand chose dans le jeu

const next_scene = preload("res://scenes/menu_arbre/main_scene_arbre.tscn")
func _on_body_entered(body: Node2D) -> void:
	if "player" in body.get_groups():		
		get_tree().change_scene_to_packed.bind(next_scene).call_deferred()
