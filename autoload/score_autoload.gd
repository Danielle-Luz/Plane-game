extends Node

const INCREMENTED_SCORE = 10

var score: int = 0
var high_score: int = 0

func _ready() -> void:
	SignalsAutoload.game_ended.connect(self.reset_score)

func increment_score() -> void:
	self.score += INCREMENTED_SCORE
	
	if(self.score > self.high_score):
		self.high_score = self.score
	
	SignalsAutoload.score_marked.emit(score)
	
func reset_score() -> void:
	self.score = 0
