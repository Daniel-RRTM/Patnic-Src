extends Node
class_name _TextToolBox_Lists_Filter


enum FORMS{         VOID         = 20 ,
					RACE         = 21 ,
					ROLE         = 22 ,
					SPECIALTY    = 23 ,
					BASE         = 24 ,
					MOD          = 25 ,
					APPENDIX     = 26 ,
					CONSUMABLE   = 27 ,
					EVENT        = 28 }




static func getBrowserFilter():return {
	
	FORMS.BASE : {
		"CREATOR"  : ["INHOUSE"],
		"M_TYPE"   : ENUM.SOKRATILES.M_TYPE.keys(),
		"CATEGORY" : ENUM.KITS.CATEGORY.keys(),
		},
	
	
	FORMS.MOD : {
		"CREATOR"  : ["INHOUSE"],
		"M_TYPE"   : ENUM.SOKRATILES.M_TYPE.keys(),
		"CATEGORY" : ENUM.KITS.CATEGORY.keys(),
	},
	
	
	FORMS.APPENDIX : {
		"CREATOR"  : ["INHOUSE"],
		"M_TYPE"   : ENUM.SOKRATILES.M_TYPE.keys(),
		"CATEGORY" : ENUM.KITS.CATEGORY.keys(),
	},
	
	
	
	
	FORMS.RACE : {
		"CREATOR"  : ["INHOUSE"],
	},
	
	
	FORMS.ROLE : {
		"CREATOR"  : ["INHOUSE"],
		"TIER"   : ["1","2","3","4","5"],
		"M_TYPE"   : ENUM.SOKRATILES.M_TYPE.keys(),	
	},
	
	
	FORMS.SPECIALTY : {
		"CREATOR"  : ["INHOUSE"],
		"M_TYPE"   : ENUM.SOKRATILES.M_TYPE.keys(),
	},
	
	
	
	FORMS.CONSUMABLE : {
	},
	
	
	
	FORMS.EVENT:{
		"CREATOR"  : ["INHOUSE"],
		"M_TYPE"   : ENUM.SOKRATILES.M_TYPE.keys(),
		"CATEGORY" : ENUM.KITS.CATEGORY.keys(),
		"KIT_PART" : ENUM.KITS.PARTS.keys(),
	}
} 



static func getCompOfFilter(): return {
	 "KIT_PART" : "C_38_KIT_PART_TYPE"
	,"CATEGORY" : "C_31_KIT_CAT_TYPE"
	,"CREATOR"  : "C_71_LEC_META_BY"
	,"M_TYPE"   : "C_37_M_TYPE"
	,"TIER"     : "C_65_TIER"
	
}



