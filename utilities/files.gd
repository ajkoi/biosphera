class_name File_utils

# fonctions relatives à l'extraction de texte de fichiers et de l'extraction de fichiers

static func get_dirs(path):
	var directorys = []
	var dir = DirAccess.open(path)
	if dir == null:
		return null
	var dirs = dir.get_directories()
	for i in dirs:
		directorys += [path.path_join(i)]
	return directorys


static func load_text(filePath):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return content
	
	
static func get_files(path, ext):
	
	var files = []
	var dir = DirAccess.open(path)
	if dir == null:
		return files
	
	dir.list_dir_begin()
	var file = dir.get_next()
	while file != "":
		file = file.replace(".remap", "")
		file = file.replace(".import", "")
		if not dir.current_is_dir() and file.ends_with(ext):
			files.append(path.path_join(file)) # path_join permet de combiner le chemin de manière safe
		file = dir.get_next()
	dir.list_dir_end()
	
	files.sort()
	return files
	
static func load_json(doc_path):
	var filepath = File_utils.get_files(doc_path, "json")[0]
	var text = File_utils.load_text(filepath)
	var json = JSON.new()
	var result = json.parse(text)
	#if result.error != OK:
		#push_error("JSON parse error: " + result.error_string)
		#return null

	return json.data
