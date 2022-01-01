extends Node

onready var _hook: RemoteTransform = get_parent()

export(NodePath) var _hook_area: NodePath
onready var _hook_area_node: Area = get_node(_hook_area)


func _ready() -> void:
	_hook_area_node.connect("area_entered", self, "_on_area_entered")


func _on_area_entered(area: Area):
	# Only grab objects in the group "collectable"
	if area in get_tree().get_nodes_in_group("collectable"): 
		_hook.remote_path = area.get_parent().get_path()
