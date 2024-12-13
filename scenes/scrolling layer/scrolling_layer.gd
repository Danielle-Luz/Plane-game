extends ParallaxLayer

@export var _sprite_image: Texture
@export var _scrolling_speed: float
@onready var _sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	self.motion_scale.x = self._scrolling_speed
	self._sprite_2d.texture = self._sprite_image
	
	var viewport_percentage_from_sprite: float = self.get_viewport_rect().size.y / self._sprite_2d.texture.get_height()
	self._sprite_2d.scale = Vector2(viewport_percentage_from_sprite, viewport_percentage_from_sprite)
	
	var new_sprite_width: float = self._sprite_2d.texture.get_width()
	self.motion_mirroring.x = new_sprite_width * viewport_percentage_from_sprite
