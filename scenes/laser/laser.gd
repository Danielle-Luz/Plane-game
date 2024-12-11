extends Area2D

class_name Laser

@onready var _score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var _animation_player: AnimationPlayer = $AnimationPlayer:
	get:
		return _animation_player

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func on_laser_surpassed(body: Node2D) -> void:
	if(is_instance_of(body, FlyingPlane)):
		ScoreAutoload.increment_score()
		self._score_sound.position = self.position
		self._score_sound.play()
