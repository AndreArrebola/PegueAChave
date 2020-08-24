extends KinematicBody2D

var sentido = 1
var vivo = true


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	get_node("Sprite").play("walking")
	pass # Replace with function body.

func _physics_process(delta):
	var new_offset = get_parent().get_unit_offset() + delta * sentido*0.3
	if sentido ==1 and new_offset >= 0.7087:
		sentido=-1
		get_parent().set_unit_offset(0.7087)
		get_node("Sprite").set_flip_h(false)
	elif sentido ==-1 and new_offset<=0:
		sentido = 1
		get_parent().set_unit_offset(0)
		get_node("Sprite").set_flip_h(true)
	else:
		get_parent().set_unit_offset(new_offset)
func esmagar():
	if not vivo: return
	vivo=false

	get_node("kill").play()
	get_node("Sprite").play("dead")
	get_node("Sprite").set_offset(Vector2(0,8))
	get_node("CollisionShape2D").queue_free()
	set_physics_process(false)