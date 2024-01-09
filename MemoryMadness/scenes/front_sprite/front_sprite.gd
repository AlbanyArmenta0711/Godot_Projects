extends TextureRect

const SCALE_SMALL: Vector2 = Vector2(0.3, 0.3)
const SCALE_NORMAL: Vector2 = Vector2(1.0, 1.0)
const SCALE_TIME: float = 0.5
const MIN_SPIN_TIME: float = 1.0 
const MAX_SPIN_TIME: float = 2.0

# Called when the node enters the scene tree for the first time.
func _ready():
	run_me()
	
func run_me() -> void:
	var tween = get_tree().create_tween()
	tween.tween_callback(set_random_image)
	tween.tween_property(self, "scale", SCALE_NORMAL, SCALE_TIME)
	tween.tween_property(self, "rotation", get_random_rotation(), get_random_spin_time())
	tween.tween_property(self, "rotation", get_random_rotation(), get_random_spin_time())
	tween.tween_property(self, "scale", SCALE_SMALL, SCALE_TIME)
	tween.tween_callback(run_me)
	
func set_random_image() -> void: 
	texture = ImageManager.get_random_item_image().item_texture

func get_random_spin_time() -> float: 
	return randf_range(MIN_SPIN_TIME, MAX_SPIN_TIME)
	
func get_random_rotation() -> float: 
	return deg_to_rad(randf_range(-360, 360))

