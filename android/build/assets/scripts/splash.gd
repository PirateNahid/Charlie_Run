extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/AnimationPlayer.play("fade in")
	await get_tree().create_timer(3).timeout
	$Control/AnimationPlayer.play("fade out")
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scene/mainmenu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
