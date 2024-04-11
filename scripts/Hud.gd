extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var coin = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	coin = coin + 1
	$Coins.text = String(coin)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
