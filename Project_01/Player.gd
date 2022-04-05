extends Node2D


# Declare member variables here. Examples:
var width = 0
export var speed = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	width = ($Sprite.texture.get_width() * $Sprite.scale.x * scale.x) / 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	# Movement
#	if Input.is_action_pressed("ui_right"):
#		position.x += 5
#	if Input.is_action_pressed("ui_left"): 
#		position.x -= 5
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	else:
		null
	position += velocity * delta
	# Boundaries
	if position.x <= width:
		position.x = 479 - width
	if position.x >= 480 - width:
		position.x = width
	# Weapon
	if Input.is_action_just_pressed("fire_projectile"):
		go.spawn_instance("Projectile", position.x, position.y)


func _on_AutoShotTimer_timeout():
	go.spawn_instance("Projectile", position.x, position.y)
	pass # Replace with function body.
