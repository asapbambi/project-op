#********************
# WalkForward.gd
#********************
extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.animation.play("Walk Forward")

func physics_update(delta: float) -> void:
	# Clean up dual inputs
	if 	    Input.is_action_pressed("ui_left") \
		and Input.is_action_pressed("ui_right"):
			finished.emit(STAND_IDLE)
	# Handle movement
	else:
		var input_direction_x := Input.get_axis("ui_left", "ui_right")
		if input_direction_x == -1:
			player.get_node("AnimatedSprite2D").flip_h = false;
		elif input_direction_x == 1:
			player.get_node("AnimatedSprite2D").flip_h = true;
		
		player.velocity.x = player.speed * input_direction_x
		player.velocity.y += player.gravity * delta
		player.move_and_slide()

		if not player.is_on_floor():
			finished.emit(FALLING)
		elif Input.is_action_just_pressed("ui_up"):
			finished.emit(JUMPING)
		elif is_equal_approx(input_direction_x, 0.0):
			finished.emit(STAND_IDLE)
