class_name SpawnersHelper
extends Object

static var nodestr_root: Node


static func node_error(error: String, ...injections: Array) -> void:
	for i in len(injections):
		var element: Variant = injections[i]
		if not is_instance_valid(element) or not element is Node:
			continue
		injections[i] = nodestr(element)
	push_error(error % injections)


static func get_tree() -> SceneTree:
	var main_loop := Engine.get_main_loop()
	if main_loop == null:
		push_error("Cannot get tree root without main loop")
		return null
	return main_loop as SceneTree


static func sumi(...args: Array) -> int:
	var total := 0
	for element in args:
		if not (element is float or element is int):
			continue
		total += int(element)
	return total


static func nodestr(node: Node) -> String:
	if not is_instance_valid(node) or not is_instance_valid(node.get_tree().root):
		return "Invalid Node (%s)" % node

	var root: Node
	if not is_instance_valid(nodestr_root):
		if not is_instance_valid(node.get_tree().root):
			node_error("Cannot find root for %s", node)
			return "Invalid Node (%s)" % node
		root = node.get_tree().root
	elif nodestr_root.get_path_to(node).is_empty():
		node_error("Cannot find root for %s", node)
		return "Invalid Node (%s)" % node
	else:
		root = nodestr_root

	return "%s (%s)" % [node.name, root.get_path_to(node)]


static func get_ancestor(of: Node, level: int) -> Node:
	var ancestor := of
	for i in max(0, level):
		ancestor = ancestor.get_parent()
	return ancestor


static func safe_free(node: Variant) -> bool:
	if node == null:
		return false
	if not node is Node:
		return false
	if not is_instance_valid(node):
		return false
	if not node.has_method(&"queue_free"):
		return false
	node.queue_free()
	return true
