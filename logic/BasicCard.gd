@tool
class_name BasicCard extends Control

@export var card_name: String
@export_multiline var card_text: String
@export var center_text: bool = true
@export var amount: int = 1

@onready var ref_card_name: RichTextLabel = $Name
@onready var ref_card_text: RichTextLabel = $CardText

func _process(_delta) -> void:
	ref_card_name.text = "[center]" + card_name + "[/center]"
	if center_text:
		ref_card_text.text = "\n[center]" + card_text + "[/center]"
	else:
		ref_card_text.text = "[center]" + card_text + "[/center]"
