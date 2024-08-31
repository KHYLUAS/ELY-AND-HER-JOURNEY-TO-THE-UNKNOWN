extends StaticBody2D


var talking = false

func _ready():
	$AnimatedSprite.play("idle")
	
func _input(event):
	if event.is_action_pressed("talk") and talking:
		open_dialog()

func open_dialog():
	var dialogPlayer = get_node_or_null("CanvasLayer")
	if dialogPlayer:
		dialogPlayer.play()



func _on_Area2D_body_exited(body):
		talking = false


func _on_Area2D_body_entered(body):
		talking = true



func _on_Area2D_area_entered(area):
	pass # Replace with function body.
