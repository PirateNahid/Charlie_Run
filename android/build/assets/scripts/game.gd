extends Node2D


# Declare member variables here. Examples:
const PLAYER_START_POS := Vector2(644,368)
const CAM_START_POS := Vector2(850,368)
var score : int
var speed : float
const START_SPEED : float = 10.0
var screen_size : Vector2
var ground_height : int
var high_score : int = 0
var obs_1 = preload("res://scene/obstacle 1.tscn")
var obs_2 = preload("res://scene/obstacle 2.tscn")
var obstacle_type := [obs_1,obs_2]
var obstacles : Array
var last_obs
# Called when the node enters the scene tree for the first time.
func _ready():
	high_score = load_score()
	print(high_score)
	screen_size = get_viewport().size
	ground_height = 30
	new_game() 
	pass # Replace with function body.


func new_game():
	score = 0
	$player.position = PLAYER_START_POS
	$ground.position =Vector2i(600,750)
	$player.velocity = Vector2i(0,0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	speed = START_SPEED + score/5000
	score += speed
	generate_obs()
	show_score()
	$player.position.x += speed
	
	if $player.position.x - $ground.position.x > screen_size.x * 1.5:
		$ground.position.x += screen_size.x
		
	for obs in obstacles:
		if obs.position.x < ($player.position.x - screen_size.x):
			remove_obs(obs)
	pass

func generate_obs():
	if obstacles.is_empty() or last_obs.position.x < score + randi_range(300,500):
		var obs_type = obstacle_type[randi()% obstacle_type.size()]
		var obs
		obs = obs_type.instantiate()
		var obs_height = obs.get_node("Sprite2D").texture.get_height()
		var obs_scale = obs.get_node("Sprite2D").scale
		var obs_x : int = screen_size.x + score + 100
		var obs_y : int = screen_size.y - ground_height - (obs_height * obs_scale.y /2) + 5
		
		last_obs = obs
		add_obs(obs,obs_x,obs_y)
		
	
	pass

func add_obs(obs, x,y):
	obs.position = Vector2i(x,y)
	obs.body_entered.connect(hit_obs)
	add_child(obs)
	obstacles.append(obs)
	
func hit_obs(body):
	if body.name == "player":
		game_over()

func check_high_score():
	if score > high_score:
		high_score = score
		print(high_score)
		save_highscore(high_score)
		


func remove_obs(obs):
	obs.queue_free()
	obstacles.erase(obs)

func show_score():
	$Control/Hud/Coins.text = str(score/10)

func game_over():
	get_tree().paused = true
	check_high_score()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/mainmenu.tscn")


func save_highscore(content):
	var file = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	file.store_32(content)
	
func load_score():
	var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
	var content = file.get_32()
	return content
