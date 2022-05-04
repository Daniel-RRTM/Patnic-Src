extends Node


# BOOKMARK[epic=Modules] 013_Pcocgen_Loot                                       

# ----- INITIALICER -------------------------------------------------------------- ##


const ENTER_PANICROOM      = "res://Assets/Sound/FX/EnterPanicRoom.wav"
const LEAVE_PANICROOM      = "res://Assets/Sound/FX/LeavePanicRoom.wav"

const MOVE_PLAYER          = "res://Assets/Sound/FX/movePlayer.wav"
const SELECT_KIT           = "res://Assets/Sound/FX/SelectKit.wav"
const RUN_KIT              = "res://Assets/Sound/FX/RunKit.wav"

const HOVER_OPTION         = "res://Assets/Sound/FX/HoverOnOption.wav"
const SELECT_OPTION        = "res://Assets/Sound/FX/SelectOption.wav"
const TRIGGER_PANIC_SLIDE  = "res://Assets/Sound/FX/TriggerPanicSlide.wav"



var _sceneManager : _15_Sound_SceneManager
var _soundPlayer : _15_Sound_AudioPlayer
func _init() :
	_sceneManager = _15_Sound_SceneManager.new()
	_soundPlayer = _15_Sound_AudioPlayer.new()





func buildSceneReference() -> void : 
	_soundPlayer = _15_Sound_AudioPlayer.new()
	_sceneManager._buildSceneReference(_soundPlayer)


func playTriggerPanicSlide() -> void :   _soundPlayer._playAudio(_15_Sound_Index.getSound("trigger panic-slide"))
func playEnterPanicRoom()    -> void :   _soundPlayer._playAudio(_15_Sound_Index.getSound("enter panicroom"))
func playLeavePanicRoom()    -> void :   _soundPlayer._playAudio(_15_Sound_Index.getSound("leave panicroom"))
func playSelectOption()      -> void :   _soundPlayer._playAudio(_15_Sound_Index.getSound("select option"))
func playHoverOption()       -> void :   _soundPlayer._playAudio(_15_Sound_Index.getSound("hover option"))
func playMovePlayer()        -> void :   _soundPlayer._playAudio(_15_Sound_Index.getSound("move player"))
func playSelectKit()         -> void :   _soundPlayer._playAudio(_15_Sound_Index.getSound("select kit"))
func playRunKit()            -> void :   _soundPlayer._playAudio(_15_Sound_Index.getSound("run kit"))



