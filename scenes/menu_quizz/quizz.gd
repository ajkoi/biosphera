extends Node2D

@onready var docs = get_tree().get_nodes_in_group("docs")
@onready var lendocs = len(docs)
@onready var displayed_doc_indice = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_forward_pressed() -> void:
	if lendocs -1 == displayed_doc_indice:
		pass
	else:
		displayed_doc_indice += 1
		for doc in docs:
			doc.visible = false
		docs[displayed_doc_indice].visible = true

func _on_backward_pressed() -> void:
	if displayed_doc_indice == 0:
		pass
	else:
		displayed_doc_indice -= 1
		for doc in docs:
			doc.visible = false
		docs[displayed_doc_indice].visible = true
