extends Area2D

var scorekiwi = 2

func _on_body_entered(body):
	if body.name == "player":
		Global.score += scorekiwi
		print(Global.score)
		$kiwi.play("collect")
		await $kiwi.animation_finished
		queue_free()
