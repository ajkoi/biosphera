extends Node2D
@export var path_img = "res://assets/interactions/test1.png"

@export var movable :bool = true

@onready var AUDIO_PLAYER = $AudioStreamPlayer
var active = false
var dif = Vector2(0, 0)
var body_in = false
@export var WIDTH = 320.0
var width_menu = WIDTH/2
var exited = false
signal used

signal node_exit(node : Node2D, dif:Vector2)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CollisionShape2D.shape = $CollisionShape2D.shape.duplicate() # pour éviter que toutes les collisionshapes soient modifiées en meme temps
	$Card.texture = load(path_img)
	$Card.scale *= width_menu/$Card.texture.get_size().x
	$Button.size = $Card.texture.get_size() * $Card.scale
	$CollisionShape2D.shape.size = $Card.texture.get_size() * $Card.scale
	$Button.position = $Card.position - $Button.size/2
	if not movable:
		scale_exit()

func _process(_delta: float) -> void:
	if active and movable:
		position = get_global_mouse_position() + dif
		if not exited:
			if (get_viewport_transform() * global_position).x >= 340:
				exited = true
				scale_exit()
				node_exit.emit($".", dif)

	if body_in and !active and position != body_in.position:
		AUDIO_PLAYER.play()
		position = body_in.position
		
func scale_exit():
	$Card.scale *= WIDTH/($Card.texture.get_size().x * $Card.scale.x)
	$Button.size = $Card.texture.get_size() * $Card.scale
	$CollisionShape2D.shape.size = $Card.texture.get_size() * $Card.scale
	$Button.position = $Card.position - $Button.size/2

func _on_button_down() -> void:
	dif = position - get_global_mouse_position()
	active = true
	used.emit()



#func _on_button_up() -> void:
	#await get_tree().create_timer(0.5).timeout
	#active = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				pass
			else:
				active = false
				
				

func _on_body_entered(body: Node2D) -> void:
	body_in = body

func _on_body_exited(_body: Node2D) -> void:
	body_in = false
