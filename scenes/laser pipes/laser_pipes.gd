extends Node2D

var _speed: float = 300

func _ready() -> void:
	var random_y_positions: Array = [0, 80, 150]
	self.position.y = random_y_positions.pick_random()

func _process(delta: float) -> void:
	self.move_left(delta)

func move_left(delta: float) -> void:
	self.position.x -= self._speed * delta
