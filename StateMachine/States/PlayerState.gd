# Boilerplate class to get full autocompletion and type checks for the `player` when coding the player's states.
# Without this, we have to run the game to see typos and other errors the compiler could otherwise catch while scripting.
class_name PlayerState extends State

const CROUCH_IDLE = "CrouchIdle"
const DASH_BACK = "DashBackward"
const DASH_FWD = "DashForward"
const FALLING = "Falling"
const JUMPING = "Jumping"
const STAND_IDLE = "StandIdle"
const WALK_BACK = "WalkBackward"
const WALK_FWD = "WalkForward"

var player: Player


func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null)
