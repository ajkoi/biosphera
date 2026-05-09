extends CharacterBody2D

@export var BASESPEED = 200
var speed = BASESPEED# 00 # How fast the player will move (pixels/sec).
@export var dashspeed = 300
var screen_size # Size of the game window.
var can_dash = true
var is_dashing = false
var velocity_dash = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.play()


var velocity_dir = Vector2.ZERO # The player's movement vector (the direction).


func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play()

	velocity_dir = Vector2.ZERO # The player's movement vector (the direction).
	if Input.is_action_pressed("move_right"):
		velocity_dir.x += 1
	if Input.is_action_pressed("move_left"):
		velocity_dir.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity_dir.y += 1
	if Input.is_action_pressed("move_up"):
		velocity_dir.y -= 1
	if Input.is_action_just_pressed("dash") and can_dash == true:
		speed = dashspeed 
		can_dash = false
		is_dashing = true
		velocity_dash = velocity
		$CanDash.start()
		$Dash.start()
	if velocity_dash.length() > 0:
		velocity_dir = velocity_dash.normalized()
	elif velocity_dir.length() > 0:
		velocity_dir = velocity_dir.normalized()
	velocity = velocity_dir * speed
	# velocity = position.clamp(Vector2.ZERO, screen_size)
	move_and_slide()

	
#d	
		


func _on_can_dash_timeout() -> void:
	can_dash = true


func _on_dash_timeout() -> void:
	speed = BASESPEED
	is_dashing = false
	velocity_dash = Vector2.ZERO
