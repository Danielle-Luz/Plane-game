extends Node2D

const _LASER_PIPES = preload("res://scenes/laser pipes/laser_pipes.tscn")

@onready var _timer: Timer = $Timer
@onready var _plane: CharacterBody2D = $Plane

func _ready() -> void:
	self.spawn_laser_pipes()
	SignalsAutoload.game_ended.connect(self.stop_spawning)

func on_timer_timeout() -> void:
	self.spawn_laser_pipes()
	
func spawn_laser_pipes() -> void:
	var laser_pipes: LaserPipes = _LASER_PIPES.instantiate()
	var x_starter_position = 308
	
	laser_pipes.position.x = x_starter_position
	
	self.add_child(laser_pipes)
	
func stop_spawning() -> void:
	self._timer.stop()
