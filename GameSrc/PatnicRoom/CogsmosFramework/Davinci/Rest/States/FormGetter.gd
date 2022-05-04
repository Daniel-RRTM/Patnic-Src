extends Node
class_name Rest_Form_Getter


static func getFormMeta():
	return{
		ENUM.SOKRATILES.M_TYPE.MAGIC:{
			"names"      : [ "Infusions" , "Spells"    , "Rites"    ],
			"Infusions"  : [ "Motive"    , "B"         , "Appendix" ],
			"Spells"     : [ "Form"      , "Medium"    , "Appendix" ],
			"Rites"      : [ "Element"   , "Behaviour" , "Appendix" ],
			
			"symbols" : [
				"res://Assets/GUI/KitSymbols/Infusion.png",
				"res://Assets/GUI/KitSymbols/Spell.png",
				"res://Assets/GUI/KitSymbols/Rite.png"],
		},

		ENUM.SOKRATILES.M_TYPE.MEAT:{
			"names"       : [ "Meeles"  , "Guns"       , "Armors"   ],
			"Meeles"      : [ "Shaft"   , "Hitzone"    , "Appendix" ],
			"Guns"        : [ "Frame"   , "Ammunition" , "Appendix" ],
			"Armors"      : [ "Coating" , "Matterial"  , "Appendix" ],
			
			"symbols" : [
				"res://Assets/GUI/KitSymbols/Meele.png",
				"res://Assets/GUI/KitSymbols/Gun.png",
				"res://Assets/GUI/KitSymbols/Armor.png"],
		},

		ENUM.SOKRATILES.M_TYPE.MATRIX:{
			"names"     : [ "Drones"   , "Hacks"       , "Cyberware"   ],
			"Drones"    : [ "Chassis"  , "Movement"    , "Appendix"    ],
			"Hacks"     : [ "Codebase" , "Target"      , "Appendix"    ],
			"Cyberware" : [ "Modell"   , "Integration" , "Appendix"    ],
			
			"symbols" : [
				"res://Assets/GUI/KitSymbols/Cyberware.png",
				"res://Assets/GUI/KitSymbols/Hack.png",
				"res://Assets/GUI/KitSymbols/Drone.png"],
		}
	}
