#********************
# Falling.gd
#********************
extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.animation.play("Fall")

func physics_update(delta: float) -> void:
	player.velocity.x = player.speed * player.jump_direction_x

	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			finished.emit(STAND_IDLE)
		else:
			finished.emit(WALK_FWD)
