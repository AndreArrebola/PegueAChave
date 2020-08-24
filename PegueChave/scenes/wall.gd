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


func _on_boss_killgame():
	soundtrack.get_node("boss").stop()
	soundtrack.get_node("stage2").play()
	queue_free()
	
	pass # Replace with function body.
