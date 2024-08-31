extends KinematicBody2D

var speed = 90
var chase = false
var player = null
var slice = false
var damage = 5
var life = 5
var hit = false


func _physics_process(delta):
	if slice:
		$AnimatedSprite.play("slice")
	elif hit:
		if life == 0:
			queue_free()
		else:
			$AnimatedSprite.play("hit")
	elif chase:
		position.x += (player.position.x - position.x)/speed
		$AnimatedSprite.play("run")
		if (player.position.x - position.x) < 0 :
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
	
	else:
		$AnimatedSprite.play("idle")


func _on_AnimatedSprite_animation_finished():
	hit = false


func _on_detection_body_entered(body):
	player = body
	chase = true


func _on_detection_body_exited(body):
	player = null
	chase = false
	

func _on_attack_area_entered(area):
	slice = true
	Global.life -= damage
	print("slice")


func _on_attack_area_exited(area):
	slice = false


func _on_hit_area_entered(area):
	life -= 1
	hit = true



func _on_attack_body_entered(body):
	pass # Replace with function body.
