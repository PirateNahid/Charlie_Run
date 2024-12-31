extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/Sprite2D/Control2/Button.pressed.connect(new_game)
	load_score()
	

func new_game():
	get_tree().change_scene_to_file("res://scene/game.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func load_score():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	var content = file.get_32()
	print(content)
	return content
