extends Node2D
@onready var ptr = 0
@export var path :String
@onready var labels_texts = get_files(path, "txt") # les paths de fichiers
@onready var labels_sounds = get_files(path, "wav")
@onready var created_labels = [] # les nodes crées pour les labels
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func get_files(path, ext):
	var files = []
	var dir = DirAccess.open(path)
	if dir == null:
		return files
	
	dir.list_dir_begin()
	var file = dir.get_next()
	while file != "":
		if not dir.current_is_dir() and file.ends_with(ext):
			files.append(path.path_join(file)) # path_join permet de combiner le chemin de manière safe
		file = dir.get_next()
	dir.list_dir_end()
	
	files.sort()
	return files
	

func load_text(filePath):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var content = file.get_as_text()
	return content
	
func _input(event: InputEvent) -> void:
	if event.is_action_released("dash"): # faire disparaitre a 100
		
		if ptr >= len(labels_texts):
			pass # Load la scene de quizz correspondante
		else:
			# créer le texte suivant
			var load_text = load_text(labels_texts[ptr])
			var label = Label.new()
			label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			label.size.x = 568
			label.text = load_text
			created_labels += [label]
			add_child(label)
			
			# déplacer les labels
			if ptr > 0: # déplacer tout les labels éxistants
				for lab in created_labels:
					lab.position.y -= created_labels[ptr].size.y 
					if lab.position.y < 100:
						lab.visible = false


			# mettre le label au bon endroit
			label.position = Vector2(480, 600 - label.size.y)
			label.visible = true
			
			# rajouter le son (lecture du texte)
		ptr+=1

			
