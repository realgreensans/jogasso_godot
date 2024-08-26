extends CanvasLayer
#para de funcionar depois que morre pela primeira vez

@onready var pausemenu = $"."
@onready var player = $"../player"
@onready var level = $".."

signal resetted

var game_paused = false

func _ready():
	visible = false

func _on_quit_pressed():
	get_tree().quit()


func _on_restart_pressed():
	get_tree().paused = false
	emit_signal("resetted")
	get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_back_pressed():
	get_tree().paused = false
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("pause") && Global.player_died == false:
		game_paused = !game_paused
		get_tree().paused = game_paused
		visible = game_paused
	
