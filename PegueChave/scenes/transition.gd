extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var next_path

func fade_to(path):
	next_path = path
	get_node("anim").play("fade")
	
func change_scene():
	if next_path !=null:
		get_tree().change_scene(next_path)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
