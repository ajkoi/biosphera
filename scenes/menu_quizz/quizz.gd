extends Control
@export var doc_path :String

const HEIGHT = 250 # a ajuster...


@onready var docs = loadfiles()
@onready var lendocs = len(docs)
@onready var displayed_doc_indice = 0
@onready var rep = get_tree().get_nodes_in_group("reponses")
@onready var lenrep = len(rep)
@export var ans :int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass

        
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
        Texture_rec.position = Vector2(100, 100)
        Texture_rec.visible = true
        docs += [Texture_rec]
    return docs

func _on_forward_pressed() -> void:
    if lendocs <= displayed_doc_indice+1:
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
