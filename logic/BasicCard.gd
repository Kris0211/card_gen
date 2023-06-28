@tool
class_name BasicCard extends Control

@export var card_icon: Texture
@export var card_name: String
@export var card_flavour: String
@export_multiline var card_text: String
@export var center_text: bool = true
@export var amount: int = 1

@onready var ref_card_name: RichTextLabel = $Name
@onready var ref_card_text: RichTextLabel = $CardText
@onready var ref_card_flavour: RichTextLabel = $Flavour
@onready var ref_card_icon: TextureRect = $Image

func _process(_delta) -> void:
	ref_card_name.text = "[center]" + card_name + "[/center]"
	ref_card_flavour.text = "[center][i]" + card_flavour + "[/i][/center]"
	if center_text:
		ref_card_text.text = "\n[center]" + card_text + "[/center]"
	else:
		ref_card_text.text = "[center]" + card_text + "[/center]"
	ref_card_icon.texture = card_icon
