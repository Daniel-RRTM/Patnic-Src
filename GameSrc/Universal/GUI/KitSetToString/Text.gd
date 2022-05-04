extends Button



func _on_Text_pressed() -> void:
		for entry in get_node("/root/Node2D/kit_effect_details").get_children(): entry.queue_free()
		
		var kitpart = API_001_Atlas.KitParts().getEntryByName(text)
		if is_instance_valid(kitpart):
			var effect
			
			match kitpart.partType():
				
				ENUM.KITS.PARTS.BASE: 
					effect = kitpart.event()
					var effectDetails = load("res://GameSrc/Universal/GUI/Effect/Base/scene.tscn").instance()
					get_node("/root/Node2D/kit_effect_details").add_child(effectDetails)
					effectDetails.loadKitpartByIndex(kitpart.index())
					
				ENUM.KITS.PARTS.MOD: 
					effect = kitpart.event().main()
					var effectDetails = load("res://GameSrc/Universal/GUI/Effect/Mod/root.tscn").instance()
					get_node("/root/Node2D/kit_effect_details").add_child(effectDetails)
					#effectDetails.loadEffect(effect)
					effectDetails.fillInByIndex(kitpart.index())
				
				ENUM.KITS.PARTS.APPENDIX : pass

