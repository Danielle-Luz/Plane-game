extends Control

@onready var press_space_label: Label = $PressSpaceLabel

func _process(delta: float) -> void:
	var was_space_pressed: bool = Input.is_action_just_pressed("ui_accept")
	var is_space_label_visible = press_space_label.visible
	
	if(was_space_pressed && is_space_label_visible):
		GameAutoload.go_to_main_scene()
