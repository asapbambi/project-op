extends CharacterBody2D

@onready var animation = get_node("AnimationPlayer")

func _physics_process(delta):
	animation.play("Idle")
	velocity += get_gravity() * delta
	move_and_slide()

#func _on_area_2d_body_entered(body):
	#if body.name == 'Player':
		#print("Collide")
