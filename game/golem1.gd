extends Area2D

var dead = false
var golem1 = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	$AnimatedSprite.play("idle")


func _on_Area2D_body_entered(body):
	Global.life -= golem1
	print(Global.life)


func _on_Area2D_area_entered(area):
	if area.is_in_group("damage"):
		queue_free()


