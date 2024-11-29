extends Node

var levels = "res://resources/levels.json"

func save(content, path):
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(JSON.stringify(content, '\t'))
	file.close()
	file = null
	
func read(path):
	var file = FileAccess.open(path, FileAccess.READ)
	return JSON.parse_string(file.get_as_text())
	
func update_record_score(handle, new_score):
	var info = read(levels)
	info[handle]['record_score'] = max(info[handle]['record_score'], new_score)
	save(info, levels)
