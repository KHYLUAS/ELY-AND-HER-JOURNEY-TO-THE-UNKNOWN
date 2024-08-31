extends CanvasLayer

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Node2D/TextureProgress.value = Global.life
	$Node2D2/coin.text = str(Global.coin)
#	pass
