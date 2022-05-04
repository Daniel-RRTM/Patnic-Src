extends Object
class_name Statistics_CmdList



static func calc():
	var mdWriter = MarkdownWriter.new()
	mdWriter.add_template_title("List of Commands")
	mdWriter.create_table(["input","description","parameter"])

	for entry in API_008_CLI.getAllCmdMeta().values():
		var parameter = entry.parameter as PoolStringArray
		var row = [entry.input,entry.toString,str(parameter.join(", "))]
		if !"WIP" in entry.input: mdWriter.add_row_table(row)

	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/API/Docs/Modules/009/List.md")
	mdWriter.writeData(Gameloop.absolutefilePath+"/Docs/Wiki/Docs/Overview/Cmd.md")
