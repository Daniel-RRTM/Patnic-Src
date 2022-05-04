extends Viewport
class_name MouseLogic


# ----- INITIALICE ----------------------------------------------------------- ##

var tilemapCenter = ENUM.SOKRATILES.CENTER_TO_DRAW
var layersToCheck = [SokraTiles.getMeatFloor(),SokraTiles.getMeatInteract(),SokraTiles.getActor()]
var playerTilemapNode 

func initialice(sizePara):
	eosTilemapByPixel = sizePara
	playerTilemapNode   = SokraTiles.getPlayer()



# ----- INPUT HANDLER -------------------------------------------------------- ##

var pos = Vector2(0,0)


var mousePos
var isMouseOnNode = true
var wasMouseOnNode = false
func manageMouseVisibillity(mousePara):
	mousePos = mousePara

	if  isMouseOnNode(mousePos):
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		isMouseOnNode = false
		wasMouseOnNode = true
		return true


	if !isMouseOnNode(mousePos) and wasMouseOnNode:
		isMouseOnNode=true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		SokraTiles.getSelection().drawMouseSelection(pos,-1)
		SokraTiles.getSelection().entsOnMap.erase(pos)
		wasMouseOnNode = false
		return false





var originTilemapByPixel = Vector2(0,0)
var eosTilemapByPixel    
func isMouseOnNode(mouse):
	return mouse.x > originTilemapByPixel.x and mouse.y > originTilemapByPixel.y and mouse.x < eosTilemapByPixel.x and mouse.y < eosTilemapByPixel.y



# ----- GETTER --------------------------------------------------------------- ##


func getMousePos(mousePos):                 return getMouseHoverOnTilemap( mousePos, API_003_Player.currentChar.pos() )
func getContextualEntityOfHover(mousePos):  return checkForEntites( getMousePos(mousePos) )
	

func getMouseHoverOnTilemap(mousePos,playerPos):
	var mousePosOfSeen   = getMouseOnTilemap(mousePos)  # pos by tile

	var relativeToPlayer = Vector2( tilemapCenter.x-mousePosOfSeen.x,  tilemapCenter.y-mousePosOfSeen.y    )
	var relativeToMap    = Vector2( playerPos.x-relativeToPlayer.x,    playerPos.y-relativeToPlayer.y      )
	var saniticedPos     = Vector2( relativeToMap.x,                   relativeToMap.y                     ) 

	return saniticedPos # +1Y because map starts at 1 instead of 0 like Arrays


func getMouseOnTilemap(mouse):
	var size = ENUM.SOKRATILES.TILE_PIXEL_SIZE / 2
	return playerTilemapNode.world_to_map( Vector2(mouse.x+size, mouse.y-size) )   # pos by tile SHOWN on screen with deadzone


var typeOfTile = ["TILE","INTERACT","ACTOR"]
func checkForEntites(pos):
	var entityToShow

	for i in layersToCheck.size():
		var currentEntity = layersToCheck[i].getEntByPos_quack(pos)

		if is_instance_valid(currentEntity): 
			entityToShow = currentEntity

	return entityToShow



