extends CharacterBody2D

const _SPEED = 500
const _FLY_SPEED = -300

func _physics_process(delta: float) -> void:
	self.velocity.y += self._SPEED * delta
	
	self.fly()
		
	self.move_and_slide()
	
func fly() -> void:
	if(Input.is_action_just_pressed("ui_up")):
		self.velocity.y = self._FLY_SPEED
