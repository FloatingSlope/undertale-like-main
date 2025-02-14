extends Control

# SIGNALS
# ENUMS
# CONSTANTS
# @EXPORT VARIABLES
# PUBLIC VARIABLES
# PRIVATE VARIABLES
# @ONREADY VARIABLES

# PUBLIC METHODS
# PRIVATE METHODS

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# SUBCLASSES





func _on_interaction_area_interacted() -> void:
	self.visible = true
	pass # Replace with function body.


func _on_interaction_area_body_exited(body:Node2D) -> void:
	self.visible = false
	pass # Replace with function body.
