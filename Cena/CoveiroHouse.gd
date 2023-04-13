extends Node3D

@onready var dooropen = false
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		if(dooropen):
			$AnimationPlayer.play("DoorClose")
			dooropen = false
		else:
			$AnimationPlayer.play("DoorOpen")
			dooropen = true
