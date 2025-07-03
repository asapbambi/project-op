# Character that moves and jumps.
class_name Player extends CharacterBody2D

## Horizontal speed in pixels per second.
@export var speed := 300.0
## Vertical acceleration in pixel per second squared.
@export var gravity := 3800.0
## Vertical speed applied when jumping.
@export var jump_impulse := 1350.0


@onready var fsm := $StateMachine
@onready var label := $Label

# Get sprite animation
@onready var animation = get_node("AnimationPlayer")

# Display current PlayerState
func _process(_delta: float) -> void:
	label.text = fsm.state.name
