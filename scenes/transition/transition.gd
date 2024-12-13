extends CanvasLayer

class_name Transition

var _new_scene: PackedScene
	
func set_new_scene(new_scene: PackedScene):
	self._new_scene = new_scene
	
func change_to_new_scene() -> void:
	self.get_parent().get_tree().change_scene_to_packed(self._new_scene)

func remove_transition_scene() -> void:
	self.queue_free()
