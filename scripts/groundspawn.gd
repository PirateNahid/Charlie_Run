extends StaticBody2D

onready var player = get_parent().get_parent().get_node("player")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if global_position.distance_to(player.global_position) > 1500:
		if player.global_position.x > global_position.x:
			queue_free()
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
