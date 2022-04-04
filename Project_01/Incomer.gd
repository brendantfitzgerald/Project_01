extends Node2D
# TODO

# Declare member variables here. Examples:
var health = 3
var targetPositionX = self.position.x
var EnemyNumber = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Enemies")
	EnemyNumber = get_tree().get_nodes_in_group("Enemies").size()
	if EnemyNumber > 3:
		targetPositionX = rand_range(0,480)
	print("EnemyNumber: ", EnemyNumber)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.y += 3
	if EnemyNumber > 3:
		if (self.position.x - targetPositionX) < -20:
			self.position.x += 1
		elif (self.position.x - targetPositionX) > 20:
			self.position.x -= 1
		else:
			targetPositionX = rand_range(0,480)
	if self.position.y >= 800:
		print("Hit bottom.")
		go.destroy(self)
	pass

func area_entered(otherArea):
	self.health -= 1
	if self.health < 1:
		go.destroy(self)
		global.score += 10
	go.destroy(otherArea.get_parent())
	if otherArea.get_parent().name == "Player":
		global.gameOver = true

