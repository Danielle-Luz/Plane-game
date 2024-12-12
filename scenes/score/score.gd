extends Control

@onready var _score_label: Label = $MarginContainer/Label

func _ready() -> void:
	SignalsAutoload.score_marked.connect(self.update_score)

func update_score(new_score: int) -> void:
	self._score_label.text = str(new_score)
