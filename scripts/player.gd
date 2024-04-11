extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,0)
const JUMPFORCE = - 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if is_on_floor():
		$animation.play("run")
	velocity.x = 300
	velocity.y = velocity.y + 50
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		$animation.play("jump")
		velocity.y = JUMPFORCE
	velocity = move_and_slide(velocity,Vector2.UP)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
