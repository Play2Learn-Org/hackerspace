extends TileMap

@export var start_x = 0
@export var start_y = 1
@export var width = 19
@export var height = 13
@export var stepsize = 2

const EMTPY_TILE = Vector2i(-1, -1)
const FLOOR_TILE = Vector2i(3,0)
const WALL_TILE = Vector2i(0,0)

# check if the coordinates are actually on the map
func on_map(to_check: Vector2i) -> bool:
	return (to_check.x >= start_x and to_check.x < width
			and to_check.y >= start_y and to_check.y < height)


# set a floor tile and surrounding wall tiles correctly
func excavate(to_excavate: Vector2i, source_id: int, floor_tile: Vector2i, wall_tile: Vector2i) -> void:
	var neighbourhood = [
		to_excavate,
		to_excavate + Vector2i.UP + Vector2i.LEFT,
		to_excavate + Vector2i.UP,
		to_excavate + Vector2i.UP + Vector2i.RIGHT,
		to_excavate + Vector2i.RIGHT,
		to_excavate + Vector2i.DOWN + Vector2i.RIGHT,
		to_excavate + Vector2i.DOWN,
		to_excavate + Vector2i.DOWN + Vector2i.LEFT,
		to_excavate + Vector2i.LEFT,
	]
	for current in neighbourhood:
		if self.get_cell_atlas_coords(0, current) == floor_tile:
			continue
		self.set_cell(0, current, source_id,
				floor_tile if current == to_excavate else wall_tile)

func random_odd_num(upper_bound: int) -> int:
	var rand = randi() % ((upper_bound / 2) - 1)
	return (rand * 2) + 1

func only_one_path(point: Vector2i) -> bool:
	var check_list = [
		point + Vector2i.UP,
		point + Vector2i.RIGHT,
		point + Vector2i.DOWN,
		point + Vector2i.LEFT,
	]
	var wallcount : int = 0
	for neighbour in check_list:
		if self.get_cell_atlas_coords(0, neighbour) == WALL_TILE:
			wallcount+=1
	return wallcount == 3

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	# track nodes we could excavate from next
	var excavated = [Vector2i(random_odd_num(width), random_odd_num(height))]
	var endpoints = []
	while excavated:
		var current: Vector2i = excavated[-1]
		var directions = [Vector2i.UP, Vector2i.RIGHT, Vector2i.DOWN, Vector2i.LEFT]
		directions.shuffle()
		while directions:
			var direction = directions.pop_back()
			if (self.get_cell_atlas_coords(0, current + stepsize * direction) != FLOOR_TILE
					and on_map(current + stepsize * direction)):
				for i in range(0, stepsize+1):
					await get_tree().create_timer(0.02).timeout
					self.excavate(current + i * direction, 0, Vector2i(3,0), Vector2i(0,0))
				excavated.append(current + stepsize * direction)
				break
			if directions.size() == 0:
				# in case all directions have been exhausted without an excavate()->break
				# it means the excavated node is fully surrounded with other excavated tiles
				var point = excavated.pop_back()
				if only_one_path(point):
					endpoints.append(point)
				# I assume that here we have the end nodes. These are the places for start, end, keys,
				# etc. I want to put a simple staircase there at first to check.
				# However, my tile generation does not look for staircases. How to handle?
				break
	endpoints.shuffle()
	self.set_cell(0,endpoints[0],0,Vector2i(1,0),0)
	self.set_cell(0,endpoints[1],0,Vector2i(2,0),0)
