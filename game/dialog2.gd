extends CanvasLayer

export(String, FILE, "*.json") var dialogue_file
var dialogues = []
var dialogID = 0

func _ready():
	$NinePatchRect.visible = false

func play():
	$NinePatchRect.visible = true
	dialogues = load_dialogue()
	dialogID -= 1
	nextline()
	
func _input(event):
	if event.is_action_pressed("talk") :
		nextline()	

func nextline():
	dialogID += 1
	if dialogID >= len(dialogues):
		reset()
		return
	if dialogues[dialogID]["Name"] == "ELY":
		$NinePatchRect/name.text = Global.regName
	else:
		$NinePatchRect/name.text = "NPC"
	$NinePatchRect/message.text = dialogues[dialogID]["Message"]
	
	print(dialogues[dialogID]["Message"])
	
func load_dialogue():
	turn_off_the_player()
	var file = File.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, file.READ)
		return parse_json(file.get_as_text())
	
func reset():
	dialogID = 0
	load_dialogue()
	turn_on_the_player()
	$NinePatchRect.visible = false
	
	
func turn_on_the_player():
	var player = get_tree().get_root().find_node("Character",true,false)
	if player:
		player.set_active(true)
		
func turn_off_the_player():
	var player = get_tree().get_root().find_node("Character",true,false)
	if player:
		player.set_active(false)
