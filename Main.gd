extends Node

@onready var label = $VBC/Label

func _ready():
	label.text = "Ready to export!"


func _on_export_once_pressed():
	_check_export_dir("res://cards/items")
	_batch_export("res://cards/items", false)


func _on_export_all_button_pressed():
	_check_export_dir("/items/")
	_batch_export("/items/", true)


func _on_export_assignments_pressed():
	_check_export_dir("/assignments/")
	_batch_export("/assignments/", true)


func _on_export_events_pressed():
	_check_export_dir("/events/")
	_batch_export("/events/", true)


func _on_export_people_pressed():
	_check_export_dir("/people/")
	_batch_export("/people/", true)


func _check_export_dir(dir: String):
	if not DirAccess.open("res://exported/"):
		DirAccess.make_dir_absolute("res://exported/")
	if not DirAccess.open("res://exported/" + dir):
		DirAccess.make_dir_absolute("res://exported/" + dir)


func _batch_export(dir: String, include_amount: bool):
	var card_paths: Array = CUM.list_files_in_directory("res://cards/" + dir)
	for card_path in card_paths:
		label.text = "Exporting: res://cards/" + dir + card_path
		print("res://cards/" + dir + card_path)
		var card_scene := load("res://cards/" + dir + card_path)
		var card_instance: Node = card_scene.instantiate()
		add_child(card_instance)
		if include_amount:
			for piece in range(card_instance.amount):
				ToImage.save_to("res://exported/" + dir + card_path.left(-5) + str(piece) + ".png")
				await get_tree().create_timer(get_process_delta_time() * 10).timeout
		else:
			ToImage.save_to("res://exported/" + dir + card_path.left(-5) + ".png")
			await get_tree().create_timer(get_process_delta_time() * 10).timeout
		remove_child(card_instance)
	label.text = "Exporting finished!"
