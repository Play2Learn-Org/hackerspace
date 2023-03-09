extends TileMap

@export var width = 25
@export var height = 25
@export var stepsize = 2

const EMTPY_TILE = Vector2i(-1, -1)

# Called when the node enters the scene tree for the first time.
func _ready():
	# TODO: change to Vector2i
	# TODO: replace thoughts about set_cellv with set_cell/get_cell_??? stuff
	# TODO: check TODOs below
	# 1. choose starting tile and add to visited and add to stack
	randomize()
	var visited = {}
	var stack = [Vector2i(randi() % width, randi() % height)]
	
	# 2. choose current from stack.pop() else end map generation
	while stack:
		var current: Vector2i = stack.pop_back()
		print(current)
		print(self.get_cell_atlas_coords(1, current))
		print(current + Vector2i.RIGHT)
		print(self.get_cell_atlas_coords(1, (current + Vector2i.RIGHT)))
		print(self.get_surrounding_cells(current))
		#self.set_cell(1, current,0,Vector2i(1,3),0)
		print("after setting current cell")
		print(self.get_cell_atlas_coords(1, current))
		print(self.get_surrounding_cells(current))
		var next: Vector2i
		return
		# 3. choose random neighbour until neighbour not visited else remove current from stack
		var neighbours = self.get_surrounding_cells(current)
		while neighbours:
			next = neighbours.pop_at(randi() % neighbours.size())
			if next not in visited.keys():
				# 3. create neighbor with open-back if doesn't exist else: open-back of neighbour
				if self.get_cell_atlas_coords(1, next) == EMTPY_TILE:
					# TODO: draw the tile, i.e. draw walls around it where necessary or take some away
					pass
				break
	self.get_cell 
	# 4. open-forward of current tile
	# 5. add neighbour to visited and stack
	# 6. go to 2.
	
	pass
