extends Node2D

class_name LaserPipes

const _PLANE_SCENE = preload("res://scenes/plane/plane.tscn")

@onready var _up_pipe: Pipe = $"Up pipe"
@onready var _lower_pipe: Pipe = $"Lower pipe"
@onready var _laser: Laser = $Laser

var _speed: float = GameAutoload.SCROLL_SPEED

func _ready() -> void:
	var random_y_positions: Array = [0, 80, 150]
	self.position.y = random_y_positions.pick_random()
	SignalsAutoload.game_ended.connect(self.end_game_when_hit_pipe)

func _process(delta: float) -> void:
	self.move_left(delta)
	
	var was_screen_boundary_exceeded = (self.get_viewport_rect().size.x - abs(self.position.x)) < 0
	
	if(was_screen_boundary_exceeded):
		self.self_destroy()

func move_left(delta: float) -> void:
	self.position.x -= self._speed * delta
	
func self_destroy() -> void:
	self.set_process(false)
	self.queue_free()

func on_pipe_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if(is_instance_of(body, FlyingPlane)):
		SignalsAutoload.game_ended.emit()

func end_game_when_hit_pipe() -> void:
	self.set_process(false)
	self._laser._animation_player.stop()
