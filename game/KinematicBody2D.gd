extends KinematicBody2D

var Floor= Vector2(0,-1)
var motion = Vector2()
var Speed = 300
var gravity = 30
var jump = 700
var movex = false
var movey = false
var slice = false

func _ready():
	$AnimatedSprite.play("slice")

func _physics_process(delta):
	
		
	if Input.is_action_pressed("left"):
		motion.x = -Speed
		$AnimatedSprite.flip_h = true
		movex= true
		
	elif Input.is_action_pressed("right"):
		motion.x = Speed
		$AnimatedSprite.flip_h = false
		movex = true 
	
	else:
		motion.x = 0
		movex = false
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			motion.y = -jump
		motion.y +=gravity
			
	
	if Input.is_action_just_pressed("slice"):
		slice = true
		$attackcon/leftcol.disabled = false
		$attackcon/rightcol.disabled = false
	
	if slice:
		motion.x = 0
		motion.y = 0
		$AnimatedSprite.play("slice")
		
	elif movex or movey:
			$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("idle")
	motion.y += gravity	
	move_and_slide(motion,Floor)
	
	if Global.life <=0 :
		get_tree().change_scene("res://gameoversheesh.tscn")
		Global.life = 100
		Global.coin = 0
	if Global.coin == 6:
		Global.life +=20
		Global.coin = 0

func _on_AnimatedSprite_animation_finished():
	slice = false 
	$attackcon/leftcol.disabled = true
	$attackcon/rightcol.disabled =true





	


func _on_Area2D10_body_entered(body):

	get_tree().change_scene("res://second background.tscn")
