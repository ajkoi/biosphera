extends Node2D

@onready var docs = get_tree().get_nodes_in_group("docs")
@onready var lendocs = len(docs)
@onready var displayed_doc_indice = 0
@onready var rep = get_tree().get_nodes_in_group("reponses")
@onready var lenrep = len(rep)
@export var ans :int
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


func _on_rep_0_pressed() -> void:
	if ans == 0:
		print("bonne réponse")
	else:
		print("wrong")

func _on_rep_1_pressed() -> void:
	if ans == 1:
		print("bonne réponse")
	else:
		print("wrong")

func _on_rep_2_pressed() -> void:
	if ans == 2:
		print("bonne réponse")
	else:
		print("wrong")

func _on_rep_3_pressed() -> void:
	if ans == 3:
		print("bonne réponse")
	else:
		print("wrong")
