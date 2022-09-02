extends StaticBody2D

func _physics_process(delta):
	$AnimationPlayer.play("wifi_plataform_idle")

func death():
	pass
