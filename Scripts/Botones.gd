extends Control

func _ready():
	pass


func _on_TextureButton_button_up():
	get_tree().quit()


func _on_Iniciar_button_up():
	get_tree().change_scene("res://Scenes/Nivel1.tscn")
