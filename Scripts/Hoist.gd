extends Node

export(NodePath) var _rope_mesh: NodePath
onready var _rope_mesh_node: MeshInstance = get_node(_rope_mesh)

export(NodePath) var _hook: NodePath
onready var _hook_node: RemoteTransform = get_node(_hook)

export(float) var _speed: float = 1.2
export(float) var _min_length: float = 0.5
export(float) var _max_length: float = 3

var _default_length: float


func _ready() -> void:
	_default_length = _rope_mesh_node.scale.y


func _physics_process(delta: float) -> void:
	var target = _hook_node.translation.y
	
	if Input.is_key_pressed(KEY_Q) and _rope_mesh_node.scale.y > _min_length:
		target += 1

	if Input.is_key_pressed(KEY_E) and _rope_mesh_node.scale.y < _max_length:
		target -= 1

	# Move hook (RemoteTransform) up and down
	_hook_node.translation.y = lerp(_hook_node.translation.y, target, _speed * delta)
	
	# Adjust rope length
	_rope_mesh_node.scale.y = _default_length - _hook_node.translation.y
