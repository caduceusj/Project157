extends Control
var callChance = 0
var NumList = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer.hide()
	$CanvasLayer/Calling.hide()
	var timer = Timer.new()
	add_child(timer)
	var delay_action = func():
		print("Delayed action")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Count.text = ("Count %d ") % callChance
	if(callChance > 100):
		State.someoneCalling = true
		$CanvasLayer/Label.visible = false
		$CanvasLayer/Calling.visible = true
		$CanvasLayer/CheckButton.disabled = true
		$CanvasLayer/CheckButton.visible = false
		$CanvasLayer/Button.visible = false
		$CanvasLayer/Button.disabled = true
		$CanvasLayer/Calling/Button2.visible = true
		$CanvasLayer/Calling/Button2.disabled = false
		$CanvasLayer/Calling/HBoxContainer/Answer.disabled = false
		$CanvasLayer/Calling/HBoxContainer/Reject.disabled = false

func _unhandled_input(event):
	if event.is_action_pressed("ui_flash"):
		if(State.hammer):
			pass
		else:
			$CanvasLayer.show()
			State.inStore = true
func _on_check_button_toggled(button_pressed):
	if(State.flashlight == false):
		State.flashlight = true
		State.flashAnim = false
		
	elif(State.flashlight == true):
		State.flashlight = false
		State.flashAnim = false


func _on_button_pressed():
	$CanvasLayer.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	State.inStore = false


func _on_reject_pressed():
	State.someoneCalling = false
	$CanvasLayer/Label.visible = true
	$CanvasLayer/Calling.visible = false
	$CanvasLayer/Calling/HBoxContainer/Answer.disabled = true 
	$CanvasLayer/Calling/HBoxContainer/Reject.disabled = true
	$CanvasLayer/CheckButton.disabled = false
	$CanvasLayer/CheckButton.visible = true
	$CanvasLayer/Calling/Button2.visible = false
	$CanvasLayer/Calling/Button2.disabled = true
	$CanvasLayer/Button.disabled = false
	$CanvasLayer/Button.visible = true

	

func _on_answer_pressed():
	State.someoneCalling = false
	$CanvasLayer/Label.visible = true
	$CanvasLayer/Calling.visible = false
	$CanvasLayer/Calling/HBoxContainer/Answer.disabled = true 
	$CanvasLayer/Calling/HBoxContainer/Reject.disabled = true
	$CanvasLayer/CheckButton.disabled = false
	$CanvasLayer/CheckButton.visible = true
	$CanvasLayer/Calling/Button2.visible = false
	$CanvasLayer/Calling/Button2.disabled = true
	$CanvasLayer/Button.disabled = false
	$CanvasLayer/Button.visible = true


func _on_timer_timeout():
	callChance = randi_range(1, 100)
