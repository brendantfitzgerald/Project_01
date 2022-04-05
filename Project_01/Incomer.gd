extends Node2D
# TODO

# Declare member variables here. Examples:
var health = 3
var targetPositionX = self.position.x
var enemySpeed = rand_range(1,6)

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Enemies")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.y += enemySpeed
	if (self.position.x - targetPositionX) < -20:
		self.position.x += 1
	elif (self.position.x - targetPositionX) > 20:
		self.position.x -= 1
	else:
		targetPositionX = rand_range(0,480)
	if self.position.y >= 800:
		go.destroy(self)
	pass

func area_entered(otherArea):
	var hit = otherArea.get_parent().name
	print (hit)
	self.health -= 1
	if self.health < 1:
		go.destroy(self)
		global.score += 10
	go.destroy(otherArea.get_parent())
	if otherArea.get_parent().name == "Player":
		global.gameOver = true

