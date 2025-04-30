extends TileMap

var map_width: int = 8400
var map_height: int = 2400
var start_time: float

func _ready() -> void:
	# Fill the tilemap
	start_time = Time.get_ticks_msec()
	fill_tilemap()
	print("Used Cells: %s" % get_used_cells(0).size())


func _input(event: InputEvent) -> void:
	# Handle left-clicks to remove tiles
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		start_time = Time.get_ticks_msec()
		# Convert global mouse position to map cell coordinates
		var cell_coord: Vector2i = local_to_map(event.global_position)
		# If there's a tile at that cell, remove it
		if get_cell_source_id(0, Vector2i(cell_coord.x, cell_coord.y)) != -1:
			set_cell(0, Vector2(cell_coord.x, cell_coord.y), -1, Vector2i.ZERO)
			print("Erase Tile %sms" % str(Time.get_ticks_msec() - start_time))


func fill_tilemap() -> void:
	for y in range(map_height):
		for x in range(map_width):
			# set_cell(Vector2i(x, y), 1, Vector2i(0, 0), 1)
			set_cell(0, Vector2i(x, y), 0, Vector2i(1,1))

	print("Fill Tiles: %sms" % str(Time.get_ticks_msec() - start_time))
