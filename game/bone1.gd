extends Area2D


var dead = false
var bone1 = 8
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	$AnimatedSprite.play("idle")


func _on_Area2D_area_entered(area):
	if area.is_in_group("damage"):
		queue_free()



func _on_Area2D_body_entered(body):
	Global.life -= bone1
	print(Global.life)
