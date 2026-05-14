class_name File_utils

# fonctions relatives à l'extraction de texte de fichiers et de l'extraction de fichiers


static func load_text(filePath):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var content = file.get_as_text()
	return content
	
	
static func get_files(path, ext):
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
