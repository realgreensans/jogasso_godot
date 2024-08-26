extends Area2D

@onready var player = $"../player"

func _on_body_entered(body):
	
	if body.name == "player" && Global.damage_taken == false:
		print("saw")
		player._takedamage(Global.start_life)
		
