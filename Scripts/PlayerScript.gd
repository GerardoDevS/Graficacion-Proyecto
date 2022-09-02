extends KinematicBody2D

var speed = 150
var velocity = Vector2.ZERO# or Vector(0, 0)
var gravity = 750
var jump = -350
var state_machine
var jumping = 0
var cooldown = 1
var can_dash = true
var timerCooldown
var token_pick = false
var esc_press = false
var timerDeath

func _ready():
	$Camera2D/Menu/Node2D.position.y -= 825
	state_machine = $AnimationTree.get("parameters/playback")
	born()
	timerCooldown = Timer.new()
	add_child(timerCooldown)
	timerCooldown.set_one_shot(true)
	timerCooldown.set_wait_time (cooldown)
	timerCooldown.connect("timeout", self, "_cooldown_dash")
	
	timerDeath = Timer.new()
	add_child(timerDeath)
	timerDeath.set_one_shot(true)
	timerDeath.set_wait_time (1)
	timerDeath.connect("timeout", self, "_cooldown_death")

func born():
	state_machine.travel("born_player")
	$Timer.start()
	
func dash():
	state_machine.travel("dash_player")
	$Timer.start()
	
	speed = 700
func dash2():
	state_machine.travel("dash_player 2")
	$Timer.start()
	speed = 700
func walk():
	state_machine.travel("walk_player")
	
func death():
	state_machine.travel("death_player")
	
	set_physics_process(false)
	timerDeath.start()

func jump():
	state_machine.travel("jump_player")
	$Timer.start()
	
func idle():
	state_machine.travel("idle_player")

func _physics_process(delta):
	
	var current = state_machine.get_current_node()
	velocity.x = 0
	velocity.y += gravity * delta
	if Input.is_action_pressed("ui_right"):
		$PlayerSpriteSheet.flip_h = true
		walk()
		velocity.x += speed
	elif Input.is_action_pressed("ui_left"):	
		$PlayerSpriteSheet.flip_h = false
		walk()
		velocity.x -= speed
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			jump()
			velocity.y = jump	
	if Input.is_action_just_pressed("ui_space") && can_dash:
		gravity = 0
		timerCooldown.start()
		dash2()
		can_dash = false
	if velocity.x == 0 :
		idle()
	velocity = move_and_slide(velocity, Vector2.UP)
	

	
func _on_Timer_timeout():
	speed = 150
	gravity = 750
func _cooldown_death():
	get_tree().reload_current_scene()
func _cooldown_dash():
	can_dash = true
	
func _discover_token():
	$Camera2D/Interface/TokenGray.hide()
	token_pick = true

func _door_pass():
	
	if token_pick == true:
		print("Good")
		get_tree().reload_current_scene()
	
	
