extends Sprite

func _ready():
	$AnimationPlayer.play("Hypercube_idle")



func _on_Area2D_body_entered(body):
	hide()
	body._discover_token()
