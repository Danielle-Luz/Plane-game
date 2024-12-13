extends Node

const SCROLL_SPEED: float = 200.0
const GAME_SCENE: PackedScene = preload("res://scenes/game/game.tscn")
const MAIN_SCENE: PackedScene = preload("res://scenes/main/main.tscn")
const TRANSITION_SCENE: PackedScene = preload("res://scenes/transition/transition.tscn")

func go_to_game_scene() -> void:
	var transition_scene = TRANSITION_SCENE.instantiate()
	transition_scene.set_new_scene(GAME_SCENE)
	self.get_tree().root.add_child(transition_scene)
	#self.get_tree().change_scene_to_packed(self.GAME_SCENE)

func go_to_main_scene() -> void:
	var transition_scene = TRANSITION_SCENE.instantiate()
	transition_scene.set_new_scene(MAIN_SCENE)
	self.get_tree().root.add_child(transition_scene)
	#self.get_tree().change_scene_to_packed(MAIN_SCENE)
