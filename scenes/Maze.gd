extends TileMap

@export var width = 25
@export var height = 25
@export var stepsize = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	# TODO: change to Vector2i
	# TODO: replace thoughts about set_cellv with set_cell/get_cell_??? stuff
	# TODO: check TODOs below
	# 1. choose starting tile and add to visited and add to stack
	randomize()
	var visited = {}
	var stack = [Vector2(randi() % width, randi() % height)]
	
	# 2. choose current from stack.pop() else end map generation
	while stack:
		var current: Vector2 = stack.pop_back()
		var next: Vector2
		# 3. choose random neighbour until neighbour not visited else remove current from stack
		var neighbours = []
		if current.y+1 <= height: neighbours.append(Vector2(current.x, current.y+1))
		if current.x+1 <= width: neighbours.append(Vector2(current.x+1, current.y))
		if current.y-1 >= 0: neighbours.append(Vector2(current.x, current.y-1))
		if current.x-1 >= 0: neighbours.append(Vector2(current.x-1, current.y))
		# TODO: What about neighbours empty?
		while neighbours:
			next = neighbours.pop_at(randi() % neighbours.size())
			if next not in visited.keys():
				break
	# 3. create neighbor with open-back if doesn't exist else: open-back of neighbour
	self.get_cell 
	# 4. open-forward of current tile
	# 5. add neighbour to visited and stack
	# 6. go to 2.
	
	pass
