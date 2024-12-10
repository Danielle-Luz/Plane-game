extends Node2D

class_name LaserPipes

var _speed: float = 200

func _ready() -> void:
	var random_y_positions: Array = [0, 80, 150]
	self.position.y = random_y_positions.pick_random()

func _process(delta: float) -> void:
	self.move_left(delta)
	
	var was_screen_boundary_exceeded = (self.get_viewport_rect().size.x - abs(self.position.x)) < 0
	
	if(was_screen_boundary_exceeded):
		self.self_destroy()
		print("destruiu")

func move_left(delta: float) -> void:
	self.position.x -= self._speed * delta
	
func self_destroy() -> void:
	self.set_process(false)
	self.queue_free()
