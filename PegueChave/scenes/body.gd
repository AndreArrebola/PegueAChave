extends KinematicBody2D

var sentido = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	pass # Replace with function body.

func _physics_process(delta):
	var new_offset = get_parent().get_unit_offset() + delta * sentido*0.3
	if sentido ==1 and new_offset >= 0.7087:
		sentido=-1
		get_parent().set_unit_offset(0.7087)
		
	elif sentido ==-1 and new_offset<=0:
		sentido = 1
		get_parent().set_unit_offset(0)
		
	else:
		get_parent().set_unit_offset(new_offset)