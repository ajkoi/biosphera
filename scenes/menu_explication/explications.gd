extends Node2D
@onready var labels = get_tree().get_nodes_in_group("texts")
@onready var ptr = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_released("dash"): # faire disparaitre a 100
		
		if ptr >= len(labels):
			pass # Load la scene de quizz correspondante
		else:
			if ptr > 0:
				for lab in labels:
					lab.position.y -= labels[ptr].size.y 
					if lab.position.y < 100:
						lab.visible = false
			labels[ptr].position = Vector2(480, 600 - labels[ptr].size.y)
			labels[ptr].visible = true
		ptr+=1

			
