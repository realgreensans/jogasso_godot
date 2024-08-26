extends Area2D

var scoreplus = 1

func _on_body_entered(body):
	if body.name == "player":
		Global.score += scoreplus
		print(Global.score)
		$melancia.play("collect")
		await $melancia.animation_finished
		queue_free()
