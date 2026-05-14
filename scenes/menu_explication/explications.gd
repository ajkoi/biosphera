extends Control
@onready var ptr = 0
@export var path :String
@export var path_quizz : String
signal fin_text(quizz_path)



@onready var labels_texts = File_utils.get_files(path, "txt") # les paths de fichiers
@onready var labels_sounds = File_utils.get_files(path, "wav")
@onready var created_labels = [] # les nodes crées pour les labels
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




	
func _input(event: InputEvent) -> void:
	if event.is_action_released("dash"): # faire disparaitre a 100

		if ptr >= len(labels_texts):
			fin_text.emit(path_quizz)
		else:
			# créer le texte suivant
			var load_text = File_utils.load_text(labels_texts[ptr])
			var label = Label.new()
			label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			label.size.x = 560
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

			
