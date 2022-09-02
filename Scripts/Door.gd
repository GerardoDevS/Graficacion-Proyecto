extends Sprite

var timerPass
var timeOut = false

func _ready():
	timerPass = Timer.new()
	add_child(timerPass)
	timerPass.set_one_shot(true)
	timerPass.set_wait_time (2)
	timerPass.connect("timeout" ,self, "entered")

func _on_Area2D_body_entered(body):
	timerPass.start()
	body._door_pass()

func entered(body):
	pass

