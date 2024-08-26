extends CanvasLayer

@onready var player = $"../player"
@onready var level = $".."
@onready var deathscreen = $"."

#var player_died = false

func _ready():
	visible = false
	emit_signal("resetted")
	player.died.connect(_resetar)
	
func _resetar():
	visible = true
	get_tree().paused = true

func _on_button_pressed():
	_die()
	
func _die():
	print("hora de morrer mêu")
	get_tree().paused = false
	visible = false
	get_tree().change_scene_to_file("res://node_2d.tscn")
