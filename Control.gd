extends Control

@onready var timer_cont = $timer_cont as Timer
@onready var scorecount = $scoreMarginContainer/score/scorecount as Label
@onready var timercounter = $timeMarginContainer/timer/timercounter as Label
@onready var lifecount = $healthMC/life/lifecount as Label
@onready var player = $"../../player"


signal time_end()
signal died()


@export_range(0,2) var default_min = 1
@export_range(0,59) var default_sec = 0
@export_range(0,3) var default_life = 3

func _ready():
	scorecount.text = str("%03d" % Global.score)
	timercounter.text = str("%02d" % default_min) + ":" + str("%02d" % default_sec)
	lifecount.text = str("%02d" % Global.life)
	
	Global.minutes = default_min
	Global.seconds = default_sec
	Global.life = default_life


func _process(_delta):
	scorecount.text = str("%03d" % Global.score)
	lifecount.text = str("%02d" % Global.life)
	if Global.minutes == 0 && Global.seconds < 0:
		player.emit_signal("died")


func _on_timer_timeout():
	if Global.seconds >= 60:
		Global.minutes += 1
		Global.seconds %= 60

	if Global.seconds == 0 && Global.minutes > 0:
		Global.minutes -= 1
		Global.seconds = 60
			
	Global.seconds -= 1
	timercounter.text = str("%02d" % Global.minutes) + ":" + str("%02d" % Global.seconds)

