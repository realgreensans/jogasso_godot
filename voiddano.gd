extends CollisionShape2D

@onready var player = $"../player"

func _on_body_entered(body):
	
	if body.name == "player":
		print("saw")
		player._takedamage(Global.start_life)
