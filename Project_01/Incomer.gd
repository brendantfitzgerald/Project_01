extends Node2D


# Declare member variables here. Examples:
var health = 3
var EnemyNumber = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Enemies")
	EnemyNumber = get_tree().get_nodes_in_group("Enemies").size()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.y += 3
	if EnemyNumber > 3:
		self.position.x += rand_range(-3,3)
	pass

func area_entered(otherArea):
	self.health -= 1
	if self.health < 1:
		go.destroy(self)
		global.score += 10
	go.destroy(otherArea.get_parent())
	if otherArea.get_parent().name == "Player":
		global.gameOver = true
	if self.position.y >= 800:
		go.destroy(self)
