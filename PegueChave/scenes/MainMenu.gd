extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	soundtrack.get_node("stage2").stop()
	soundtrack.get_node("intro").play()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_play_pressed():
	soundtrack.get_node("intro").stop()
	get_node("go").play()
	transition.fade_to("res://scenes/Game.tscn")
	pass # Replace with function body.
