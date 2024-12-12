extends Node

const SCROLL_SPEED: float = 200.0
const GAME_SCENE: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN_SCENE = preload("res://scenes/main/main.tscn")

func go_to_game_scene() -> void:
	self.get_tree().change_scene_to_packed(self.GAME_SCENE)

func go_to_main_scene() -> void:
	self.get_tree().change_scene_to_packed(MAIN_SCENE)
