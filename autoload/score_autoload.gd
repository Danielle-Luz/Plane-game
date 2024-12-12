extends Node

const INCREMENTED_SCORE = 10
const HIGH_SCORE_PATH = "user://high_score.txt"

var score: int = 0
var high_score: int = 0

func _ready() -> void:
	SignalsAutoload.game_ended.connect(self.reset_score)
	SignalsAutoload.game_ended.connect(self.update_file_high_score)
	self.set_highscore_from_file()

func increment_score() -> void:
	self.score += INCREMENTED_SCORE
	
	if(self.score > self.high_score):
		self.high_score = self.score
	
	SignalsAutoload.score_marked.emit(score)
	
func set_highscore_from_file() -> void:
	var highscore_file: FileAccess = FileAccess.open(self.HIGH_SCORE_PATH, FileAccess.READ)
	
	if highscore_file:
		if highscore_file.get_length() > 0:
			var stored_high_score: int = highscore_file.get_32()
			self.high_score = stored_high_score
		highscore_file.close()
		
func update_file_high_score() -> void:
	print("deveria armazenar")
	var high_score_file: FileAccess = FileAccess.open(self.HIGH_SCORE_PATH, FileAccess.WRITE)
	if high_score_file:
		high_score_file.store_32(self.high_score)
		print("armazenou")
		high_score_file.close()
	
func reset_score() -> void:
	self.score = 0
