extends PlayerState

const JUMP_SPEED_INC = 100.0

func enter(previous_state_path: String, data := {}) -> void:
	player.animation.play("Jump")
	player.velocity.y = -player.jump_impulse


func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("ui_left", "ui_right")
	player.velocity.x = (player.speed + JUMP_SPEED_INC) * input_direction_x

	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if player.velocity.y >= 0:
		finished.emit(FALLING)
