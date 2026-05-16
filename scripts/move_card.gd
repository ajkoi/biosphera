extends Node2D
@export var path_img = "res://assets/interactions/test1.png"
@onready var AUDIO_PLAYER = $AudioStreamPlayer
var active = false
var dif = Vector2(0, 0)
var body_in = false
const WIDTH = 150
signal used
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Card.texture = load(path_img)
	$Card.scale *= WIDTH/$Card.texture.get_size().x
	$Button.size = $Card.texture.get_size() * $Card.scale
	$CollisionShape2D.shape.size = $Card.texture.get_size() * $Card.scale
	$Button.position = $Card.position - $Button.size/2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:	
		position = get_global_mouse_position()
	if body_in and !active and position != body_in.position:
		AUDIO_PLAYER.play()
		position = body_in.position
		


func _on_button_down() -> void:
	dif = position - get_viewport().get_mouse_position()
	active = true
	used.emit()



func _on_button_up() -> void:
	active = false


func _on_body_entered(body: Node2D) -> void:
	body_in = body

func _on_body_exited(body: Node2D) -> void:
	body_in = false
