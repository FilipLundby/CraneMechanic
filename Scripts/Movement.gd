extends Node

onready var _parent: KinematicBody = get_parent()
var _speed: float = 2.5
var _velocity = Vector3.ZERO


# This is just some basic movement - I haven't put much thought into it.
# It's more or less copy/paste from the docs:
# https://docs.godotengine.org/en/3.4/tutorials/2d/2d_movement.html


func _physics_process(_delta: float) -> void:
	_velocity = Vector3.ZERO

	if Input.is_key_pressed(KEY_A):
		_velocity.x -= 1
	if Input.is_key_pressed(KEY_D):
		_velocity.x += 1
	if Input.is_key_pressed(KEY_W):
		_velocity.z -= 1
	if Input.is_key_pressed(KEY_S):
		_velocity.z += 1
	
	_velocity = _velocity.normalized() * _speed
	_velocity = _parent.move_and_slide(_velocity)
