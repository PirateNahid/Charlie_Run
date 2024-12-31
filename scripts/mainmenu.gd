extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/Sprite2D/Control2/Button.pressed.connect(new_game)
	$AnimatedSprite2D.play("idle")
	score = load_score()
	$Control/Sprite2D/Control2/Button2.pressed.connect(show_score)
	$Control/Sprite2D/Control2/Quit.pressed.connect(quit)
	if FileAccess.file_exists("user://save_name.dat"):
		$Name_bg.visible = false
		var file = FileAccess.open("user://save_name.dat", FileAccess.READ)
		print(file.get_var())
	else:
		$Name_bg/Name.text_submitted.connect(_on_name_entered)
	
	
func _on_name_entered(new_text: String):
	print(new_text)
	var file = FileAccess.open("user://save_name.dat", FileAccess.WRITE)
	file.store_var(new_text)
	$Name_bg.visible = false
	
func new_game():
	get_tree().change_scene_to_file("res://scene/game.tscn")

func show_score():
	get_tree().change_scene_to_file("res://addons/quiver_leaderboards/leaderboard_ui.tscn")
	
func quit():
	get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_score():
	var content
	if FileAccess.file_exists("user://save_game.dat"):
		var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
		content = file.get_64()
		print("Main Loaded Score: " + str(content))
	else:
		content = 10
		var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
		file.store_64(content)
	return content
