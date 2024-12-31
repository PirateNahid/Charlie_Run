extends CharacterBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const JUMPFORCE = - 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if is_on_floor():
		$animation.play("run")
	velocity.y = velocity.y + 50
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		$animation.play("jump")
		velocity.y = JUMPFORCE
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	velocity = velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
