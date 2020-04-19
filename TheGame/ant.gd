extends KinematicBody2D

const MAX_SPEED = 500
const ACCELERATION = 6000
var motion = Vector2.ZERO

const ROTATION_CORRECTION = deg2rad(90)

var dead = false

func die():
	dead = true
	$Animation.playing = false
	$Animation.frame = 4
	$SoundFX.play()

func _physics_process(delta):
	if not dead:
		var axis = get_input_axis()
		if(axis == Vector2.ZERO):
			apply_friction(ACCELERATION * delta)
			$Animation.playing = false
			$Animation.frame = 0
		else:
			$Animation.playing = true
			apply_movement(axis * ACCELERATION * delta)
		motion = move_and_slide(motion)
	
func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis.normalized()
	
func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO
		
func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)
	rotation = motion.angle() - ROTATION_CORRECTION



