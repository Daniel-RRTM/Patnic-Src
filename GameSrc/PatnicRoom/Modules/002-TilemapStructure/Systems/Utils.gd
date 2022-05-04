extends Node
class_name _002_Utils



static func modPos(posBase:Vector2,directionEnum:int,reach:int):
	return modifyPosOneByPosTwo(posBase, convertToVector(directionEnum,reach) )



static func modifyPosOneByPosTwo(posBase:Vector2,posMod:Vector2):
	return Vector2(posBase.x-posMod.x , posBase.y-posMod.y) 



static func convertToVector(directionEnum:int,timesX):
	var direction = ENUM.INPUT_PANIC.INPUTS.MOVEMENT
	var posMod
	match directionEnum:
		ENUM.SOKRATILES.DIRECTION_FOUR.NORTH:
			posMod = Vector2(0,1)
		ENUM.SOKRATILES.DIRECTION_FOUR.WEST:
			posMod = Vector2(-1,0)
		ENUM.SOKRATILES.DIRECTION_FOUR.EAST:
			posMod = Vector2(1,0)
		ENUM.SOKRATILES.DIRECTION_FOUR.SOUTH:
			posMod = Vector2(0,-1)
	
	return Vector2(posMod.x*timesX,posMod.y*timesX)



