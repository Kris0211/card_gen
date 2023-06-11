extends Node

var card_paths: Array

func _ready():
	card_paths = CUM.list_files_in_directory("res://cards/")
	$VBC/Label.text = "Ready to export!"


func _on_export_all_button_pressed():
	_check_export_dir()
	_batch_export(true)


func _on_export_once_pressed():
	_check_export_dir()
	_batch_export(false)


func _check_export_dir():
	if not DirAccess.open("res://exported/"):
		DirAccess.make_dir_absolute("res://exported/")


func _batch_export(include_amount: bool):
	for card_path in card_paths:
		$VBC/Label.text = "Exporting: res://cards/" + card_path
		var card_scene := load("res://cards/" + card_path)
		var card_instance: Node = card_scene.instantiate()
		add_child(card_instance)
		if include_amount:
			for piece in range(card_instance.amount):
				ToImage.save_to("res://exported/" + card_path.left(-5) + str(piece) + ".png")
				await get_tree().create_timer(0.01).timeout
		else:
			ToImage.save_to("res://exported/" + card_path.left(-5) + ".png")
			await get_tree().create_timer(0.01).timeout
		remove_child(card_instance)
	$VBC/Label.text = "Exporting finished!"
