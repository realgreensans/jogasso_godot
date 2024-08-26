extends CharacterBody2D
#começa o script

const SPEED = 200.0 #marca uma velocidade constante
const JUMP_VELOCITY = -310.0 #^ ao pulo

var is_jumping = false
var is_right = false
var knockback = false
@onready var bunecoanim = $bunecoanim as AnimatedSprite2D
@onready var control = $"../HUD/Control"

# Ge# the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") #pega um default

signal died

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		#se a funçao (personagem ) nao estiver no chao, a velocidade leva atribuiçao do valor da gravidade X delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor() and !Global.damage_taken:
		velocity.y = JUMP_VELOCITY
		is_jumping = true
	elif is_on_floor():
		is_jumping = false
		#se a tecla dos lados forem pressionadas E estiver no chao, atribui a velocidade do pulo

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions. (fala que deve-se trocar as açoes de UI por açoes customizáveis da gameplay)
	#variável de direçao
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction && !Global.damage_taken:
		#se existir
		velocity.x = direction * SPEED
		$bunecoanim.scale.x = direction
		if velocity.x > 0:
			is_right = true
		else:
			is_right = false
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED) 
		
			#animação
	if !Global.damage_taken:
		if is_on_floor():
			if is_jumping:
				$bunecoanim.play("Jump")
			elif direction != 0:
				$bunecoanim.play("Run")
			elif direction == 0:
				$bunecoanim.play("Idle")
		else:
			if velocity.y <0:
				$bunecoanim.play("Jump")
			else:
				$bunecoanim.play("Fall")

	move_and_slide()

func _takedamage(damage):
	Global.damage_taken = true
	$bunecoanim.play("Hurt")
	knockback = true
	if knockback == true && Global.player_invinc == false:
		if is_right == true:
			Global.player_invinc = true
			velocity.x = -900
		else:
			Global.player_invinc = true
			velocity.x = +900
	await Global.seconds
	await $bunecoanim.animation_finished
	Global.damage_taken = false
	Global.player_invinc = false
	Global.life -= damage
	if Global.life <= 0:
		Global.player_died = true
		print("dead")
		emit_signal("died")
		Global.life = 3
	else:
		print("eoauhgoigerogi")
		print("lost hp")
	

func _on_body_entered(_body):
	pass # Replace with function body.
