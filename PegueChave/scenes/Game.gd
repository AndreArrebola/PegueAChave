extends Node2D

onready var personagem = get_node("Personagem")
onready var stage1 = get_node("Stage1")
onready var stage2 
onready var camera = get_node("camera")
onready var level1 = preload("res://scenes/Stage1.tscn")
onready var level2 = preload("res://scenes/Stage2.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var s
var moedas=0
var vidas = 3
var enekill = 0
var nota
var enemax = 6
var haskey=false
var nextst = false
var reset=false
onready var stage = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	
	set_process(true) # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func change_camera():

		camera.set_global_position(personagem.get_node("Camera2D").get_camera_position())
		camera.make_current()



func _on_Personagem_morreu():
	soundtrack.get_node("stage1").stop()
	soundtrack.get_node("stage2").stop()
	get_node("SomDeath").play()
	change_camera()
	keylost()
	moedas=0
	get_node("CanvasLayer2/moedas").set_text(str(moedas))
	get_node("spawn_timer").start()
	vidas -=1
	if vidas==2:
		get_node("CanvasLayer2/Panel/heart1").set_texture(load("res://assets/hud_heartEmpty.png"))
	elif vidas== 1:
		get_node("CanvasLayer2/Panel/heart2").set_texture(load("res://assets/hud_heartEmpty.png"))
	elif vidas==0:
		get_node("CanvasLayer2/Panel/heart3").set_texture(load("res://assets/hud_heartEmpty.png"))
		get_node("CanvasLayer2/Panel/gg2").set_visible(true)
	
	pass # Replace with function body.


func _on_spawn_timer_timeout():
	if vidas > 0:
		
		get_node("CanvasLayer2/Panel/gg").set_visible(false)
		if stage==1:
			soundtrack.get_node("stage1").play()
			if nextst==true:
				soundtrack.get_node("stage1").stop()
				stage1.queue_free()
				stage=2
				enemax=10
				s=level2.instance()
				add_child(s)
				get_node("Chave").position=Vector2(3712.618, -1311.307)
				stage2=get_node("Stage2")
				moedas=0
				enekill=0
				nextst=false
				soundtrack.get_node("stage2").play()
				get_node("CanvasLayer2/moedas").set_text(str(moedas))
			
			reviver()
		elif stage==2:
			if nextst==true:
				get_node("CanvasLayer2/Panel/gg2").set_visible(false)
				transition.fade_to("res://scenes/MainMenuReset.tscn")
			soundtrack.get_node("stage2").play()
			
			reviver()
		
	else:
		get_node("CanvasLayer2/Panel/gg2").set_visible(false)
		transition.fade_to("res://scenes/MainMenu.tscn")
	pass # Replace with function body.

func reviver():
	personagem.set_position(get_node("spawn_point").get_position())
	personagem.reviver()
	get_node("game_time").set_wait_time(300)
	get_node("game_time").start()
	


func _on_Personagem_fim():
	if haskey:
		soundtrack.get_node("stage1").stop()
		soundtrack.get_node("stage2").stop()
		get_node("SomGG").play()
		get_node("CanvasLayer2/Panel/gg").set_text("Fase concluida!\n\nMoedas coletadas: " + str(moedas) + "/20\nInimigos derrotados: "+ str(enekill) + "/"+ str(enemax) + "\n\nNota: " + nota(moedas, enekill))
		get_node("CanvasLayer2/Panel/gg").set_visible(true)
		change_camera()
		keylost()
		nextst=true
		if(stage==2):
			reset=true
		get_node("spawn_timer").start()
		
	pass # Replace with function body.

func nota(coin, enek):
	var score
	score=coin-(enemax-enek)
	if score<=0:
		return "E"
	elif score<=5:
		return "D"
	elif score <=10:
		return "C"
	elif score <=15:
		return "B"
	elif score<20:
		return "A"
	else:
		return "S\nParabens!"

func _on_Personagem_moeda():
	get_node("SomCoin").play()
	moedas+=1
	get_node("CanvasLayer2/moedas").set_text(str(moedas))
	

func _process(delta):
	get_node("CanvasLayer2/Panel/time").set_text(str(int(get_node("game_time").get_time_left())))

func _on_Personagem_keygot():
	if !haskey:
		get_node("CanvasLayer2/Panel/PanelKey/key").set_visible(true)
		get_node("Chave").set_visible(false)
		haskey=true
		get_node("SomKey").play()
		print("Chave obtida")
	pass # Replace with function body.
	
func keylost():
	get_node("CanvasLayer2/Panel/PanelKey/key").set_visible(false)
	get_node("Chave").set_visible(true)
	haskey=false
	
	pass # Replace with function body.


func _on_Personagem_enekill():
	enekill=enekill+1
	pass # Replace with function body.
