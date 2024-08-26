extends Node2D

@onready var player = $player
@onready var pausemenu = $pausemenu
@onready var deathscreen = $deathscreen
@onready var menu = $"."

func _ready():
	player.died.connect(_resetar)
	pausemenu.resetted.connect(_resetar)
	
func _resetar():
	get_tree().reload_current_scene
	Global.score = 0




