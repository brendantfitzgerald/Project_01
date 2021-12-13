extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var width = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	width = ($Sprite.texture.get_width() * $Sprite.scale.x * scale.x) / 2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Movement
	if Input.is_action_pressed("ui_right"):
		position.x += 5
	if Input.is_action_pressed("ui_left"): 
		position.x -= 5
	# Boundaries
	if position.x <= width:
		position.x = 479 - width
	if position.x >= 480 - width:
		position.x = width
	# Weapon
	if Input.is_action_just_pressed("fire_projectile"):
		go.spawn_instance("Projectile", position.x, position.y)
	pass


func _on_AutoShotTimer_timeout():
	go.spawn_instance("Projectile", position.x, position.y)
	pass # Replace with function body.
