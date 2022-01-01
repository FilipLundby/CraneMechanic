extends Node

onready var _hook: RemoteTransform = get_parent()


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.scancode == KEY_SPACE and !_hook.remote_path.is_empty():
			var cube: RigidBody = get_node(_hook.remote_path)
			cube.angular_velocity = Vector3.ZERO
			cube.linear_velocity = Vector3.ZERO
			_hook.remote_path = ""
			
			# Let's give the cube a small push down when releasing it, 
			# otherwise it might hover mid air.
			cube.apply_central_impulse(Vector3.DOWN * 0.1)
