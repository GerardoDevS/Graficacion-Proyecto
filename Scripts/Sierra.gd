extends Area2D

var leDio = false
var state_machine

func _ready():
	$AnimationPlayer.play("SierraAnimation")
	


func _on_Area2D_body_entered(body):
	if leDio == false:
		
		body.death() # Replace with function body.
		leDio = true
