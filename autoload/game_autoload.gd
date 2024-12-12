extends Node

const SCROLL_SPEED: float = 200.0
const GAME_SCENE: PackedScene = preload("res://scenes/game/game.tscn")

func change_scene() -> void:
	var rendered_scene = self.get_tree().current_scene
	var game_scene = self.GAME_SCENE.instantiate()
	
	if(rendered_scene != game_scene):
		self.get_tree().change_scene_to_packed(self.GAME_SCENE)
