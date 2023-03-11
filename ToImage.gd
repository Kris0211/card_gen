extends Node

@onready var target_viewport = get_tree().get_root().get_viewport()


func save_to(path):
	await RenderingServer.frame_post_draw
	var img = target_viewport.get_texture().get_image()
	img.flip_y()
	return img.save_png(path)


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed(&"save_img"):
		var scene_name = get_tree().get_current_scene().get_name()
		save_to("res://exported/" + scene_name + ".png")
