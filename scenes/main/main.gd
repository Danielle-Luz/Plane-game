extends Control

@onready var _highscore_value_label: Label = $MarginContainer/HighscoreValueLabel
const _GAME_SCENE: PackedScene = preload("res://scenes/game/game.tscn")

func _ready() -> void:
	self._highscore_value_label.text = str(ScoreAutoload.score)
	
func _process(delta: float) -> void:
	var was_space_pressed: bool = Input.is_action_just_pressed("ui_accept")
	if(was_space_pressed):
		GameAutoload.change_scene()
