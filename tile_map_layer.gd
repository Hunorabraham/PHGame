extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#load which room
	# replace with actual tokenisation function later, input needs to be spaced out for now
	# hard coded for now
	#load room
	var file = FileAccess.open("res://data//Room1.txt", FileAccess.READ)
	var content = file.get_as_text()
	for line in content.split("\n",false):
		var dataPerLine = line.split(":",false)
		var coords = parseVector(dataPerLine[0])
		match dataPerLine[1]:
			"floor":
				#add floortile
				self.set_cell(coords, -1,Vector2i(0,0),0)
				pass
			"transition":
				#add transition
				self.set_cell(coords, -1,Vector2i(1,0),0)
				pass
	
	#for tile in self.get_used_cells():
	#	print_debug(tile,self.get_cell_atlas_coords(tile), self.get_cell_source_id(tile))

func parseVector(source :String) -> Vector2i:
	var nums = source.split(",")
	return Vector2i(int(nums[0]),int(nums[1]))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
