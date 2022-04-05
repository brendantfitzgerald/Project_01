extends Node2D

#onready var weapon = $Weapon
#could have this instead:
onready var weapons = $Weapons.get_children()
#the order of the weapons will matter here, since it matters which is which...
#having the list of weapons be based on the children on the weapons node seems instable....


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
		#make relevant weapon fire
		#this is janky as fuck and probably stupid.
		#will at the very least want to make different projectile types (the first argument of the fire funtion)
		#and make the projectiles spawn where the left/right weapons would be.
		#all this said, I have no idea if a left/right weapon is what you had in mind when replacing left/right movement.
		for weapon in weapons:
			if weapon.weapon_type == "main":
				weapon.fire("Projectile", position.x, position.y);
				print("main fired")
			if weapon.weapon_type == "left":
				weapon.fire("Projectile", position.x, position.y);
				print("left fired")
			if weapon.weapon_type == "right":
				weapon.fire("Projectile", position.x, position.y);
				print("right fired")
			
		



func _on_AutoShotTimer_timeout():
	go.spawn_instance("Projectile", position.x, position.y)
	pass # Replace with function body.
