extends Area2D


func _on_body_entered(body):
	if body.name == "player":
		
		Global.seconds += Global.timecherry
		print("+10 seconds")
		$cherry.play("collect")
		await $cherry.animation_finished
		queue_free()
