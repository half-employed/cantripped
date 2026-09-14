extends Control

func _ready():
	$CenterContainer/VBoxContainer/ExitButton.pressed.connect(_on_exit_pressed)

func _on_exit_pressed():
	get_tree().quit()
