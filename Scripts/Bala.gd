extends Area2D

var dir = 0
var speed = 500
var leDio = false


func _physics_process(delta):
	pass
	
func _ready():
	$AnimationPlayer.play("Disparo")
	

	

func _on_Area2D_body_entered(body):
	if leDio == false:
		
		body.death() # Replace with function body.
		leDio = true
		print("le di")
