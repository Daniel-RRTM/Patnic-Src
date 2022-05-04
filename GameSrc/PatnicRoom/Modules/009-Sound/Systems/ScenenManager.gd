extends Object
class_name _15_Sound_SceneManager



func _buildSceneReference(audioPlayer) -> void:
	if !is_instance_valid(Gameloop.scene): printerr("SCENE-MANAGER FOR SOUND FOUND NO ROOT-SCENE")
	else:
		
		if !is_instance_valid(Gameloop.scene.get_node("audioPlayer")): 
			Gameloop.scene.add_child(audioPlayer)




