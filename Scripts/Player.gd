extends KinematicBody2D

var speed = 150
var velocity = Vector2.ZERO# or Vector(0, 0)
var gravity = 750
var jump = -350

func _physics_process(delta):
#	#?
	$AnimationTree/AnimationPlayer.play("player_idle")
	velocity.x = 0
	velocity.y += gravity * delta
	if Input.is_action_pressed("ui_right"):
		get_node("MainPlayer").set_flip_h(false)
		velocity.x += speed
	elif Input.is_action_pressed("ui_left"):	
		get_node("MainPlayer").set_flip_h(true)
		velocity.x -= speed
	
	velocity = move_and_slide(velocity, Vector2.UP)		
func _unhandled_input(event):
	if event is InputEventKey:
		if is_on_floor():
			if event.pressed and event.scancode == KEY_UP:
				velocity.y = jump
