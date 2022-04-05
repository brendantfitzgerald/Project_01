extends Node2D

export var weapon_type = "main"
#the if statements in the fire function and this array are dumb as hell. find a better way to do this.
var weapons_active = [1,0,0] #main, left, right

#left weapon gets fired from certain coordinates with certain bullet type
#right weapons VVV
#which weapon, what coordinates, what bullet?

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func fire(projectile_type, x, y):
	go.spawn_instance(projectile_type, x, y)
