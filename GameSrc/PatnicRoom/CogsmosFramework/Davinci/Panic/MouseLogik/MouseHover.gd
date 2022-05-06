extends Viewport
class_name MouseHoverOverTileMap


# ----- INITIALICE ----------------------------------------------------------- ##

var mouseLogic
var debugPanel

func _ready():
	mouseLogic = MouseLogic.new()
	debugPanel = .get_tree().get_root().get_node("Node2D/root_ViewMode/Debug")
	mouseLogic.initialice(self.size)



# ----- INPUT HANDLER -------------------------------------------------------- ##


var isMouseOnNode = true
var lookAtInst

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mousePos = get_viewport().get_mouse_position() # pos by pixel
		if  mouseLogic.manageMouseVisibillity(mousePos): givePlayerFeedback(mousePos)
	if event.is_action("Interface_Mouse_Right"): showOnlookMenue()


var lastPos = Vector2(0,0)
func givePlayerFeedback(mousePos):
	var ent = mouseLogic.getContextualEntityOfHover(mousePos)
	showOnDebug(ent)
	drawMouseOnTilemap(ent,mousePos)



# ----- DEBUG ---------------------------------------------------------------- ##


func showOnDebug(ent):
	debugPanel.get_node("position dynamic").bbcode_text = str(ent.pos())
	debugPanel.get_node("texture dynamic").bbcode_text  = str(ent.index())
	debugPanel.get_node("Type dynamic").bbcode_text     = str(ent.typeToString())


func drawMouseOnTilemap(ent,mousePos):
	var currentPos   = mouseLogic.getMousePos(mousePos)
	var saniticedPos = Vector2(currentPos.y,currentPos.x-1)
	var indexToShow  = MouseMarker.getMouseMarker(ent)
	SokraTiles.getSelection().drawMouseSelection(lastPos,-1)
	SokraTiles.getSelection().entsOnMap.erase(Vector2(lastPos.y,lastPos.x))
	SokraTiles.getSelection().drawMouseSelection(saniticedPos,indexToShow)
	
	lastPos = saniticedPos



# ----- ONLOOK --------------------------------------------------------------- ##


func showOnlookMenue():
	var mousePos = get_viewport().get_mouse_position() # pos by pixel
	var tilePos  = mouseLogic.getMousePos(mousePos)
	var ent      = mouseLogic.checkForEntites(tilePos)
	
	if is_instance_valid(lookAtInst): lookAtInst.queue_free()
	lookAtInst = load("res://GameSrc/PatnicRoom/Scenes/Unique/Look at Panel/Look.tscn").instance()
	lookAtInst.initialice(ent,mouseLogic.mousePos,self)
	get_tree().get_root().add_child(lookAtInst)
