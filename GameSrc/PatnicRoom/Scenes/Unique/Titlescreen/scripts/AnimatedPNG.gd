extends Sprite


var nthFrameToSwitch
var speed
var sumOfFrames
var nthFrameToAnimate


func _init() :
	sumOfFrames = 0
	nthFrameToSwitch = 100
	nthFrameToAnimate = 2
	speed = 0.3
	goesUp=true

var pos
var goesUp
func animateTitleSprite():
	sumOfFrames += 1

	if isTimeToShowNextFrame():
		var x = self.get_position().x
		var y = self.get_position().y

		if goesUp:
			y = y + speed
		else:
			y = y - speed

		set_position( Vector2(x,y) )

	if isTimeToSwitchMode():
		changeMode()



func isTimeToShowNextFrame():
	return sumOfFrames % nthFrameToAnimate == 0

func isTimeToSwitchMode():
	return sumOfFrames % nthFrameToSwitch == 0

func changeMode():
	if goesUp:
		goesUp = false
	elif !goesUp:
		goesUp = true
