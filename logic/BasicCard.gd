@tool
class_name BasicCard extends Control

@export var card_name: String
@export_multiline var card_text: String

@onready var ref_card_name: RichTextLabel = $Name
@onready var ref_card_text: RichTextLabel = $CardText

func _process(_delta) -> void:
	ref_card_name.text = "[center]" + card_name + "[/center]"
	ref_card_text.text = "\n[center]" + card_text + "[/center]"
