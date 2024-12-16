extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#load which room
	# replace with actual tokenisation function later, input needs to be spaced out for now
	# hard coded for now
	#load room
	loadRoom(1)
	

func loadRoom(id: int)->void:
	var file = FileAccess.open("res://data//Room%d.txt" % id, FileAccess.READ)
	var content = file.get_as_text(true)
	for line in content.split("\n",false):
		var dataPerLine = line.split(":",false)
		var coords = parseVector(dataPerLine[0])
		match dataPerLine[1]:
			"floor":
				#add floortile
				print_debug("vittu")
				self.set_cell(coords, 0,Vector2i(0,0),0)
			"transit":
				#add transition
				self.set_cell(coords, 0,Vector2i(1,0),0)

func parseVector(source :String) -> Vector2i:
	var nums = source.split(",")
	return Vector2i(int(nums[0]),int(nums[1]))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
