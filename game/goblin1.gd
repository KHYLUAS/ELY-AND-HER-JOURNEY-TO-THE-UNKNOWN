extends Area2D

var dead = false
var goblin1 = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 
	
func _process(delta):
	$AnimatedSprite.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	Global.life -= goblin1
	print(Global.life)


func _on_Area2D_area_entered(area):
	if area.is_in_group("damage"):
		queue_free()
