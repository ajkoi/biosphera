extends CharacterBody2D


@export var speed = 100# 00 # How fast the player will move (pixels/sec).
@export var dashspeed = 130
var screen_size # Size of the game window.
var can_dash = true
var is_dashing = false
var velocity_dash = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.play()

const SPEED = 300.0
const JUMP_VELOCITY = -400.0



func _physics_process(delta: float) -> void:
	$AnimatedSprite2D.play()

	var velocity_dir = Vector2.ZERO # The player's movement vector (the direction).
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
		velocity_dir = velocity_dash.normalized() * speed
	elif velocity_dir.length() > 0:
		velocity_dir = velocity_dir.normalized() * speed
	velocity = velocity_dir * delta * speed
	
	# velocity = position.clamp(Vector2.ZERO, screen_size)
	move_and_slide()

	
	
	# ANIMATIONS
	if velocity_dir.y < 0 and is_dashing:
		$AnimatedSprite2D.animation = "dash_up"
	elif velocity_dir.y > 0 and is_dashing:
		$AnimatedSprite2D.animation = "dash_down"
	elif velocity_dir.x < 0  and is_dashing:
		$AnimatedSprite2D.animation = "dash_side"
		$AnimatedSprite2D.flip_h = false
	elif velocity_dir.x > 0  and is_dashing:
		$AnimatedSprite2D.animation = "dash_side"
		$AnimatedSprite2D.flip_h = true
	elif velocity_dir.y < 0:
		$AnimatedSprite2D.animation = "walk_up"
	elif velocity_dir.y > 0:
		$AnimatedSprite2D.animation = "walk_down"
	elif velocity_dir.x < 0:
		$AnimatedSprite2D.animation = "walk_side"
		$AnimatedSprite2D.flip_h = false
	elif velocity_dir.x > 0:
		$AnimatedSprite2D.animation = "walk_side"
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.animation = "idle"
	
		


func _on_can_dash_timeout() -> void:
	can_dash = true


func _on_dash_timeout() -> void:
	speed = 74
	is_dashing = false
	velocity_dash = Vector2.ZERO
