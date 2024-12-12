extends Node2D

const _LASER_PIPES_SCENE = preload("res://scenes/laser pipes/laser_pipes.tscn")
const _GAME_OVER_SCENE = preload("res://scenes/game over/game_over.tscn")

@onready var _timer: Timer = $Timer
@onready var _plane: CharacterBody2D = $Plane
@onready var _end_game_canvas_layer: CanvasLayer = $EndGameCanvasLayer

func _ready() -> void:
	self.spawn_laser_pipes()
	SignalsAutoload.game_ended.connect(self.stop_spawning)
	SignalsAutoload.game_ended.connect(self.show_end_game_screen)

func on_timer_timeout() -> void:
	self.spawn_laser_pipes()
	
func spawn_laser_pipes() -> void:
	var laser_pipes: LaserPipes = _LASER_PIPES_SCENE.instantiate()
	var x_starter_position = 308
	
	laser_pipes.position.x = x_starter_position
	
	self.add_child(laser_pipes)
	
func stop_spawning() -> void:
	self._timer.stop()
	
func show_end_game_screen() -> void:
	var game_over_scene: Control = self._GAME_OVER_SCENE.instantiate()
	self._end_game_canvas_layer.add_child(game_over_scene)
