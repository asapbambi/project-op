extends PlayerState


func enter(previous_state_path: String, data := {}) -> void:
	player.animation.play("Idle")
	player.velocity.x = 0.0


func physics_update(_delta: float) -> void:
	player.velocity.y += player.gravity * _delta
	player.move_and_slide()

	if not player.is_on_floor():
		finished.emit(FALLING)
	elif Input.is_action_just_pressed("ui_up"):
		finished.emit(JUMPING)
	# Clean up dual inputs
	elif !(Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right")):
		if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
			finished.emit(WALK_FWD)
