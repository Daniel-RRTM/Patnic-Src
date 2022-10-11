extends Node

const STARTING_KITS_SUB_SCENE   = "res://GameSrc/Universal/Scenes/Bootstrap/GameInit/Submenues/StartingKitSets/SubScene.tscn"
const BOOT_MODE_SUB_SCENE       = "res://GameSrc/Universal/Scenes/Bootstrap/GameInit/Submenues/Bootmode/SubScene.tscn"
const CONTENT_MANAGER_SUB_SCENE = "res://GameSrc/Universal/Scenes/Bootstrap/GameInit/Submenues/content Manager/SubScene.tscn"

var currentOptionForm
func _enter_tree() -> void: 
	Gameloop.scene = self
	API_009_Sound.buildSceneReference()
	OS.window_size = Vector2(1100,550)



func _on_default_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
	Gameloop.startTitleMode()

# TODOD entfernen
func alt_Alecandria():
	OS.window_fullscreen = !OS.window_fullscreen
	get_tree().change_scene("res://GameSrc/Alecandria/Main.tscn")


func _on_options_pressed() -> void:
	API_009_Sound.playSelectOption()
	get_node("optionsPanel").visible = true;
	get_node("options").visible = false
	get_node("RichTextLabel").visible = false




func _on_kitsToStart_pressed() -> void:
	API_009_Sound.playSelectOption()
	removeOtherOptionIfNeccessary()
	addScene(STARTING_KITS_SUB_SCENE)

func _on_bootMode_pressed() -> void:
	API_009_Sound.playSelectOption()
	removeOtherOptionIfNeccessary()
	addScene(BOOT_MODE_SUB_SCENE)

func _on_communityContent_pressed() -> void:
	API_009_Sound.playSelectOption()
	removeOtherOptionIfNeccessary()
	addScene(CONTENT_MANAGER_SUB_SCENE)




func removeOtherOptionIfNeccessary():
	API_009_Sound.playSelectOption()
	if is_instance_valid(currentOptionForm):
		get_node("optionsPanel/Form").remove_child(currentOptionForm)
		currentOptionForm = null

func addScene(filepath:String):
	API_009_Sound.playSelectOption()
	var loadedScene = load(filepath)
	currentOptionForm = loadedScene.instance()
	get_node("optionsPanel/Form").add_child(currentOptionForm)







