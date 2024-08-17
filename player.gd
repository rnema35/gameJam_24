extends CharacterBody2D


const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var currPos = position

var currPosVec = Vector2(currPos.x, currPos.y)

@export var moveMat = Transform2D()

func _ready():
	var tempVec = Vector2(100, 100)
	position = tempVec
	
	var sx = 2
	var sy = 1.5
	var smat = Transform2D(Vector2(sx, 0), Vector2(0, sy), Vector2(0, 0))
	print(smat)

	var tempPos = smat.basis_xform(position)
	
	position = tempPos
	print(position)



func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
