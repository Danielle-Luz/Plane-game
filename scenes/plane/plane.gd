extends CharacterBody2D

class_name FlyingPlane

@onready var _animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var _animation_player: AnimationPlayer = $AnimationPlayer

const _SPEED = 500
const _FLY_SPEED = -300

func _ready() -> void:
	SignalsAutoload.game_ended.connect(self.die)

func _physics_process(delta: float) -> void:
	if(self.is_on_ceiling() || self.is_on_floor()):
		SignalsAutoload.game_ended.emit()
	
	self.velocity.y += self._SPEED * delta
	
	self.fly()
		
	self.move_and_slide()
	
func fly() -> void:
	if(Input.is_action_just_pressed("ui_up")):
		self._animation_player.play("Fly up")
		self.velocity.y = self._FLY_SPEED

func die() -> void:
	self.set_physics_process(false)
	self._animated_sprite_2d.stop()
