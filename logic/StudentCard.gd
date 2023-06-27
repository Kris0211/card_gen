@tool
extends BasicCard

@export var start_psycha_value: String
@export var student_color: Color

@onready var psycha_value := $PanelPsycha/Psycha
@onready var psycha_panel := $PanelPsycha

func _process(_delta):
	super(_delta)
	psycha_value.text = "[center]" + str(start_psycha_value) + "[/center]"
	psycha_panel.self_modulate = student_color
