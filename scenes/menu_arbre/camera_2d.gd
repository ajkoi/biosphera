extends Camera2D
@export var zoom_speed: float = 0.1
@export var zoom_min: float = 0.2
@export var zoom_max: float = 3
@export var pan_button: MouseButton = MOUSE_BUTTON_RIGHT

var is_panning: bool = false
var pan_start: Vector2 = Vector2.ZERO

func _unhandled_input(event: InputEvent) -> void:
	# --- ZOOM with scroll wheel ---
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			zoom_camera(zoom_speed)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			zoom_camera(-zoom_speed)
		
		elif event.button_index == pan_button:
			is_panning = event.pressed
			if is_panning:
				pan_start = get_global_mouse_position()

	# --- Move camera while panning ---
	if event is InputEventMouseMotion and is_panning:
		var current_mouse = get_global_mouse_position()
		position += pan_start - current_mouse
		position.x = clamp(position.x, limit_left, limit_right)
		position.y = clamp(position.y, limit_top, limit_bottom)

func zoom_camera(amount: float) -> void:
	var new_zoom = zoom.x + amount
	new_zoom = clamp(new_zoom, zoom_min, zoom_max)
	zoom = Vector2(new_zoom, new_zoom)
	
