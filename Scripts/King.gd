extends CharacterBody2D

@export var speed = 100
var last_position
@onready var _body = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	last_position = global_position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	get_animation_for(last_position - global_position)
	last_position = global_position
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	
func get_animation_for(direction: Vector2):
	
	# moving left
	if direction.x > 0 and abs(direction.x) > abs(direction.y):
		if direction.y == 0:
			_body.play("left")
		elif direction.y > 0:
			_body.play("upLeft") 
		else :
			_body.play("downLeft")	
	# moving right
	if direction.x < 0 and abs(direction.x) > abs(direction.y):
		if direction.y == 0:
			_body.play("right")
		elif direction.y > 0:
			_body.play("upRight") 
		else :
			_body.play("downRight")

	# moving up
	if direction.y > 0 and abs(direction.y) > abs(direction.x):
		if direction.x == 0:
			_body.play("up")
		elif direction.x > 0:
			_body.play("upLeft") 
		else :
			_body.play("downRight")

	# moving down
	if direction.y < 0 and abs(direction.y) > abs(direction.x):
		if direction.x == 0:
			_body.play("down")
		elif direction.x > 0:
			_body.play("downLeft") 
		else :
			_body.play("downRight")

