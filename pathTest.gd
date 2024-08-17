extends Node2D

@export var checkpoint_texture: Texture2D
var music_playing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#audioPlayer = $AudioStreamPlayer2D
	var tempPath = make_path()
	visualize_path(tempPath)
	#$AudioStreamPlayer2D.play()

func make_path():
	var p1 = Vector2(100, 100)
	var p2 = Vector2(250, 200)
	var p3 = Vector2(500, 400)
	
	var tempPoints = PackedVector2Array()
	tempPoints.append(p1)
	tempPoints.append(p2)
	tempPoints.append(p3)
	
	for point in tempPoints:
		$Path2D.curve.add_point(point)
		
	return tempPoints

func visualize_path(points: PackedVector2Array):
	for point in points:
		var checkpoint_sprite = Sprite2D.new()
		checkpoint_sprite.texture = checkpoint_texture
		checkpoint_sprite.position = point
		add_child(checkpoint_sprite)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var targetPos = Vector2(250, 200)
	$Path2D/PathFollow2D.h_offset += 0.5
	var currPos =  $Path2D/PathFollow2D/ColorRect.global_position
	#print(currPos)
	
	if currPos.distance_to(targetPos) < 50:
		print('true')
		play_music()

func play_music(): 
	if music_playing == false:
		print('in music player')
		$AudioStreamPlayer2D.play(5)
		music_playing = true
