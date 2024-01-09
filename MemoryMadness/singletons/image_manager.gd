extends Node

var _item_images: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	load_item_images()

func add_file_to_list(file_name: String, path: String) -> void: 
	var full_path = path + "/" + file_name
	var dic_entry = {
		"item_name": file_name.rstrip(".png"),
		"item_texture": load(full_path)
	}
	_item_images.append(dic_entry)

func load_item_images() -> void: 
	var path = "res://assets/glitch"
	var dir = DirAccess.open(path)
	
	if not dir:
		print("ERROR:", path)
		return 
	
	var file_names = dir.get_files()
	
	for file in file_names: 
		if ".import" not in file: 
			add_file_to_list(file, path)
	print("loaded images: ", _item_images.size())

func get_random_item_image() -> Dictionary:
	return _item_images.pick_random()
