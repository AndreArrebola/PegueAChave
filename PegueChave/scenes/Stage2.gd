extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_bosstrigger_body_entered(body):
	if body.has_method("moeda"):
		soundtrack.get_node("stage2").stop()
		soundtrack.get_node("boss").play()
		get_node("bosstrigger").queue_free()
	pass # Replace with function body.
