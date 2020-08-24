extends Area2D


func _on_moeda_body_entered(body):
	if body.has_method("moeda"):
		body.moeda()
	get_node("anim").play("coletar")
	get_node("shape").queue_free()
	yield(get_node("anim"), "animation_finished")
	queue_free()

