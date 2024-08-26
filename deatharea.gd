extends Area2D
@onready var player = $"../player"

func _on_body_entered(body):
	pass # Replace with function body.
	
	if body.name == "player":
		player._takedamage(Global.start_life)
		print("void")
		emit_signal("died")
