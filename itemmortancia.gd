extends Area2D

@onready var player = $"../player"

func _on_itemmortancia_body_entered(body):
	pass # Replace with function body
	
	if body.name == "player" && Global.damage_taken == false:
		player._takedamage(1)
		print("mortancia")

