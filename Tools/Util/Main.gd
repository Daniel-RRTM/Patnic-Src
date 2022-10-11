extends Node


var all : Dictionary


func _ready() -> void:
	all["randomNumberGenerator"] = _Util_RNG.new()
	all["directory"]             = _Util_Directory.new()
	all["dictionary"]            = _Util_Dictionary.new()
	all["nodes"]                 = NodesManager.new()
	all["json"]                  = _Util_JSON.new()


func directory()    ->  _Util_Directory  :   return all.directory
func dictionary()   ->  _Util_Dictionary :   return all.dictionary
func node()         ->  NodesManager      :   return all.nodes
func json()         ->  _Util_JSON       :   return all.json
func rng()          ->  _Util_RNG        :   return all.randomNumberGenerator



