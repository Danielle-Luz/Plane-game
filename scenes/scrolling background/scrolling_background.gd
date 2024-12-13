extends ParallaxBackground

func _ready() -> void:
	SignalsAutoload.game_ended.connect(self.stop_scrolling)

func _process(delta: float) -> void:
	self.scroll_offset.x -= GameAutoload.SCROLL_SPEED * delta
	
func stop_scrolling() -> void:
	self.set_process(false)
