extends CanvasLayer

@onready var menu = $"."
@onready var level = $".."
@onready var player = $"../player"
@onready var hud = $"../HUD"
@onready var pausemenu = $"../pausemenu"

signal resetted()

var menuon = true

func _ready():
	pass


func _on_quitmenu_pressed():
	get_tree().quit()


func _on_menuplay_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")

