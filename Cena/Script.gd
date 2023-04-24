extends Node3D

@onready var collision = get_node("Pillar/Grade1/StaticBody3D/CollisionShape3D")
@onready var collision2 = get_node("Pillar/Grade2/StaticBody3D/CollisionShape3D")
@onready var collision3 = get_node("Pillar8/Node3D3/StaticBody3D/CollisionShape3D")
@onready var collision4 = get_node("Pillar8/Node3D4/StaticBody3D/CollisionShape3D")

@onready var hammered = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("Player"):
		$Pillar/Grade1.visible = true
		$Pillar/Grade2.visible = true
		collision.set_deferred("disabled", false)
		collision2.set_deferred("disabled", false)
		collision3.set_deferred("disabled", false)
		collision4.set_deferred("disabled", false)






func _on_hammer_area_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("Hammer"):
		hammered = hammered + 1
		#Place here audio track
		print("detected")
		if(hammered == 3):
			State.breakHammer = true
		
