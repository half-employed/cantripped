extends CanvasLayer

@onready var chat_panel: PanelContainer = $PanelContainer
@onready var output_log: RichTextLabel = $PanelContainer/VBoxContainer/OutputLog
@onready var input_field: LineEdit = $PanelContainer/VBoxContainer/InputField

var is_open := false


func _ready():
	chat_panel.visible = false
	input_field.text_submitted.connect(_on_command_submitted)
	add_message("Debug Console")
	add_message("Type a command and press Enter\n")


func _unhandled_input(event):
	if event.is_action_pressed("toggle_debug_console"):
		toggle_console()
		get_viewport().set_input_as_handled()


func toggle_console():
	is_open = !is_open
	chat_panel.visible = is_open

	if is_open:
		input_field.grab_focus()
	else:
		input_field.release_focus()


func _on_command_submitted(command: String):
	command = command.strip_edges()

	if command.is_empty():
		return

	add_message("> " + command)

	input_field.clear()


func add_message(message: String):
	output_log.append_text(message + "\n")
