extends Control

var is_paused = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state
		if !is_paused:
			$Node2D.position.y += 850
			is_paused = not is_paused
		else:
			$Node2D.position.y -= 850
			is_paused = not is_paused

func _on_Salir_button_up():
	get_tree().quit()
	
	


func _on_Reset_button_up():
	get_tree().reload_current_scene()
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
