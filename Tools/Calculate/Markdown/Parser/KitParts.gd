extends Node
class_name Statistics_Parser_KitParts



static func calc(mode:String, filepath:String,entry):
	var mdWriter = MarkdownWriter.new()
	var kit      = entry
	var event    = kit.event()
	
	mdWriter.add_header("**"+kit.name()+"**",1)

	mdWriter.add_header("**Generall**",4)
	baseKitToDok(kit,mdWriter)
	mdWriter.add_linebreak()

	mdWriter.add_header("**Event**",4)
	parseSeize(event, mdWriter)
	parseSteps("Consider", event.SELECT.CONSIDER, mdWriter)
	parseSteps("Perform", event.RUN.PERFORM, mdWriter)


	mdWriter.add_linebreak()
	mdWriter.add_content_new_line("-----")
	
#	mdWriter.add_header("**Mods**",2)
#	mdWriter.add_content_new_line("("+str(entry.modArr.size())+" found)")
#
#	for mod in entry.modArr.values():
#		mdWriter.add_header(mod.name(),4)
#		baseKitToDok(mod,mdWriter)
#		var modifications = mod.getCompValue("C_49_EVENT_REFERENCE").getCompValue("C_74_EVENT_MAIN_DICT")["DATA"]["MODIFICATION"][0]
#		mdWriter.add_row_table([ "modification", str(modifications) ])
	
	
	mdWriter.writeData(Gameloop.absolutefilePath+filepath)





static func baseKitToDok(kitpart:KitPartEntity,mdWriter):
	var dict = {	"mechanical summary" : kitpart.mechanicalSummary() ,
					"cooldown time"      : kitpart.cooldownTime()      ,
					"decription"         : kitpart.decription()        ,
					"mod time"           : kitpart.modTime()           ,
					"rarity"             : kitpart.rarity()            }
	mdWriter.create_table(["Stat","Value"])
	for compName in dict.keys(): mdWriter.add_row_table([ compName, str(dict[compName]) ])



static func parseSeize(event:Dictionary, mdWriter:MarkdownWriter):
	var dict = {	"Source" : event.SELECT.SEIZE.SOURCE ,
					"Medium" : event.SELECT.SEIZE.MEDIUM ,
					"Reach"  : event.SELECT.SEIZE.REACH  }
	mdWriter.create_table(["","**Seize**",""])
	for compName in dict.keys(): mdWriter.add_row_table([ compName, "",str(dict[compName]) ])



static func parseSteps(nameOfSteps:String,arrOfSteps,mdWriter):
	mdWriter.add_row_table(["","**"+nameOfSteps+"**",""])
	for perf in arrOfSteps :
		var one 
		if perf.has("connector"): one = perf.connector
		if perf.has("typeOfCache"): one = perf.typeOfCache
		var two = perf.operation
		var step = perf.parameter.values() as PoolStringArray
		mdWriter.add_row_table([ one,two,step.join(" ")])






