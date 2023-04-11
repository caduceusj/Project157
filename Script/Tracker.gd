extends Node3D
var player_node: Node = null
var playerTracker
var position_label: Label
var aux
func _ready():
	# Find the player node by its name
	player_node = get_node("Player")

func _process(delta: float):
	# Update the position of this node to match the player's position
	if player_node != null:
		var position = player_node.transform.origin
		var position_str = "Posição: (%.2f, %.2f, %.2f)" % [position.x, position.y, position.z]
		$Label.text = position_str
		
		
