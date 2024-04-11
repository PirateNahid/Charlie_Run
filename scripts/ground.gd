extends Node2D

const GROUNDSPAWNER = preload("res://scene/ground.tscn")
const OBSTACLE = preload("res://scene/obstacle.tscn")
const GROUNDWIDTH = 607
var spawn_position = global_position
var obstacle_position = global_position
onready var player = get_parent().get_node("player")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if spawn_position.distance_to(player.global_position) < 20*64:
		spawn_ground()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func spawn_ground():
	var spawn_ground_instance = GROUNDSPAWNER.instance()
	add_child(spawn_ground_instance)
	spawn_ground_instance.global_position.x = spawn_position.x
	spawn_position.x = spawn_position.x + GROUNDWIDTH

	
