extends Control

@onready var _highscore_value_label: Label = $MarginContainer/HighscoreValueLabel

func _ready() -> void:
	self._highscore_value_label.text = str(ScoreAutoload.score)
