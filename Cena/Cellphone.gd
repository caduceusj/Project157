extends MeshInstance3D

var auxLantern = State.flashlight
@onready var anim_play = get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(State.someoneCalling):
		$Screen.hide()
		$Screen2.show()
	else:
		$Screen.show()
		$Screen2.hide()
	if(State.inStore):
		get_node(".").visible = false
		State.flashAnim = false
	if(State.flashAnim == false and State.inStore == false):
		if(State.flashlight == true and State.flashlight != auxLantern ):
			get_node(".").visible = true
			$Lantern.visible = true
			anim_play.play("CellphoneTurnOn")
			State.flashAnim = true
			auxLantern = State.flashlight
		elif(State.flashlight == false and State.flashlight != auxLantern):
			get_node(".").visible = true
			anim_play.play("CellphoneTurnOff")
			$Lantern.visible = false
			State.flashAnim = true
			auxLantern = State.flashlight
		else:
			get_node(".").visible = true
