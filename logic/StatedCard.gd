@tool
extends BasicCard

@export var first_stat_icon: Texture
@export var second_stat_icon: Texture
@export var third_stat_icon: Texture
@export var first_stat_value: int
@export var second_stat_value: int
@export var third_stat_value: int

@onready var first_icon := $Stats/Stat1/Icon
@onready var second_icon := $Stats/Stat2/Icon
@onready var third_icon := $Stats/Stat3/Icon
@onready var first_value := $Stats/Stat1/Value
@onready var second_value := $Stats/Stat2/Value
@onready var third_value := $Stats/Stat3/Value

func _process(_delta):
	super(_delta)
	first_icon.texture = first_stat_icon
	second_icon.texture = second_stat_icon
	third_icon.texture = third_stat_icon
	#first_value.text = "[center]" + str(first_stat_value) + "[/center]"
	#second_value.text = "[center]" + str(second_stat_value) + "[/center]"
	#third_value.text = "[center]" + str(third_stat_value) + "[/center]"
