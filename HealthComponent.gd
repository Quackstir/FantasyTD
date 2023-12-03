class_name HealthComponent
extends Node2D


@export var Max_Health: int = 1
@onready var Curr_Health: int = Max_Health: set = _set_health, get = _get_health

signal Health_Change
signal onDeath

func _take_damage(damage):
	_set_health(Curr_Health - damage)

func _set_health(new_value : float):
	Curr_Health = new_value
	print("New Health: " + str(Curr_Health))
	emit_signal("Health_Change", new_value)
	if Curr_Health <= 0:
		Death()
	
func _get_health():
	return Curr_Health
	
func Death():
	emit_signal("onDeath")
