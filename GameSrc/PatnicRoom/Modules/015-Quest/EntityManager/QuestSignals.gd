extends Node
class_name _015_Signals


signal Wanted_Actor_Killed
signal Player_Walked_Step
signal Player_Used_Kit

signal Player_Completed_Quest






func getSignalAtlas() -> Dictionary:
	return{
	
	"Wanted_Actor_Killed": {		 "toStr" : "sent when an Actor dies and gets free"
									,"para"  : "flagArray of Actor"
									,"usage" : ["KILL"]                                             },
	
	"Player_Walked_Step": {			 "toStr" : "sent when moves by WASD"
									,"para"  : "N/A"
									,"usage" : ["REST_WITH"]                                        },
	
	"Player_Used_Kit": {			 "toStr" : "sent when player enters a kitselection"
									,"para"  : "N/A"
									,"usage" : ["REST_WITH"]                                        },
	
	"Player_Completed_Quest": {		 "toStr" : "sent when entering restmode and its validation"
									,"para"  : "Nr of coresponding Quest in API_Player.currentQuest"
									,"usage" : []                                                   }
	} 



