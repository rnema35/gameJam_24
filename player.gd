extends CharacterBody2D

@export var framesBwSave = 60
var currFrame = 0

const SPEED = 300.0

func get_input():
	look_at(get_global_mouse_position())
	var direction = Input.get_axis("ui_down", "ui_up")	
	velocity = transform.x * direction * SPEED

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	currFrame += 1
	
	if currFrame == framesBwSave:
		currFrame = 0
		$Path2D.curve.add_point(position)
		
		var tempPoints = $Path2D.curve.get_baked_points()
		print(tempPoints)
	
	get_input()
	move_and_slide()
