extends Node2D

var animal_scene: PackedScene = preload("res://scenes/animal/animal.tscn")

@onready var debug_label = $DebugLabel
@onready var animal_spawn = $AnimalSpawn

# Called when the node enters the scene tree for the first time.
func _ready():
	setup()
	SignalManager.on_update_debug_label.connect(on_update_debug_label)
	SignalManager.on_animal_died.connect(spawn_animal)
	spawn_animal()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_Q):
		GameManager.load_main_scene()
		
func setup() -> void: 
	var tc = get_tree().get_nodes_in_group(GameManager.GROUP_CUP)
	ScoreManager.set_target_cups(tc.size())

func on_update_debug_label(text: String) -> void:
	debug_label.text = text
	
func spawn_animal() -> void: 
	var animal = animal_scene.instantiate()
	animal.global_position = animal_spawn.global_position
	add_child(animal)
