extends Node
# BOOKMARK[epic=Modules] 001_Atlas                                             
# DOCS  > Docs\API\docs\Cogsmos\democrECS\SokraTILES.md                        
# DOCS  > TO ADD                                                               


# ----- INITIALICE --------------------------------------------------------- ##


var _interactables ; var _tiles      ; var _actorTemplate
var _role          ; var _race       ; var _specialty
var _kitparts      ; var _conditions
var _quest         ; var _lootFilter ; var _connection

func _init() -> void:
	_connection    = _001_Connection.new()
	_lootFilter     = _001_LootFilter.new()
	_quest           = _001_Quest.new()
	_tiles           = _001_Tiles.new()
	_interactables   = _001_Interactables.new()
	_actorTemplate   = _001_RNG_Actor_Template.new()
	
	_role            = _001_Role.new()
	_race            = _001_Race.new()
	_specialty       = _001_Specialty.new()
	
	_kitparts        = _001_Kitparts.new()
	_conditions      = _001_Conditions.new()



# ----- GETTER --------------------------------------------------------------- ##


func Tiles()				-> _001_Tiles				:  return _tiles
func Interactables()		-> _001_Interactables		:  return _interactables
func Conditions()			-> _001_Conditions			:  return _conditions
func Race()					-> _001_Race				:  return _race
func Specialties()			-> _001_Specialty			:  return _specialty
func Role()					-> _001_Role				:  return _role
func KitParts()				-> _001_Kitparts			:  return _kitparts
func RNGActorTemplate()		-> _001_RNG_Actor_Template	:  return _actorTemplate
func LootFilter()		    -> _001_LootFilter      	:  return _lootFilter
func Quest()	        	-> _001_Quest	            :  return _quest
func Connection()			-> _001_Connection			:  return _connection




# ----- SETTER --------------------------------------------------------------- ##


func addTileSet(name:String,dict:Array)	-> void	: _tiles.createTileset(name,dict)
func sortKitpartsAtlas()				-> void : _kitparts.sortEntries()


func getTemplate(type:String,index:String) -> Entity:
	match type.replace(" ",""):
		"RACE"       : return Race().getEntry(index) as Entity
		"ROLE"       : return Role().getEntry(index) as Entity
		"QUEST"      : return Quest().getEntry(index) as Entity
		"SPECIALTY"  : return Specialties().getEntry(index) as Entity
		"LOOTFILTER" : return LootFilter().getEntry(index) as Entity
	return null
