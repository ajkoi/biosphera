extends Control
@export var doc_path :String

const HEIGHT = 432 # a ajuster...
signal fin_text

@onready var docs = loadfiles()
@onready var lendocs = len(docs)
@onready var displayed_doc_indice = 0
@onready var rep = get_tree().get_nodes_in_group("reponses")
@onready var lenrep = len(rep)
var ans :int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_quests()

func load_quests():
	var data = File_utils.load_json(doc_path)
	ans = data["ans"]
	$questionlabel.text = data["question"]
	$rep0.text = data["rep0"]
	$rep1.text = data["rep1"]
	$rep2.text = data["rep2"]
	$rep3.text = data["rep3"]
		
func loadfiles():
	var docs = []
	for file in File_utils.get_files(doc_path, "PNG"):
		var Loaded_file = load(file)
		var Texture_rec = TextureRect.new()
		Texture_rec.texture = Loaded_file
		add_child(Texture_rec)
		Texture_rec.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		Texture_rec.size.x *= HEIGHT / Texture_rec.size.y
		Texture_rec.size.y = HEIGHT
		Texture_rec.position = Vector2(540-Texture_rec.size.x/2, 32)
		Texture_rec.visible = true
		docs += [Texture_rec]
	return docs

func right_ans():
	fin_text.emit()

func wrong_ans():
	$lab_err.text = "Oups, tu t'est trompé, recommence"
	$timer_err.start()

func _on_forward_pressed() -> void:
	if lendocs <= displayed_doc_indice+1:
		displayed_doc_indice = 0
	else:
		displayed_doc_indice += 1
	for doc in docs:
		doc.visible = false
	docs[displayed_doc_indice].visible = true

func _on_backward_pressed() -> void:
	if displayed_doc_indice == 0:
		displayed_doc_indice = lendocs - 1
	else:
		displayed_doc_indice -= 1
	for doc in docs:
		doc.visible = false
	docs[displayed_doc_indice].visible = true

func _on_rep_0_pressed() -> void:
	if ans == 0:
		right_ans()
	else:
		wrong_ans()

func _on_rep_1_pressed() -> void:
	if ans == 1:
		right_ans()
	else:
		wrong_ans()

func _on_rep_2_pressed() -> void:
	if ans == 2:
		right_ans()
	else:
		wrong_ans()

func _on_rep_3_pressed() -> void:
	if ans == 3:
		right_ans()
	else:
		wrong_ans()


func _on_timer_err_timeout() -> void:
	$lab_err.text = ""
