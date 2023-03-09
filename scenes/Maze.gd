extends TileMap

@export var width = 25
@export var height = 25
@export var stepsize = 2

const EMTPY_TILE = Vector2i(-1, -1)

func wait(wtime: int):
	#lol
	var t = Timer.new()
	t.set_wait_time(wtime)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	t.queue_free()


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
		var next: Vector2i
		# 3. choose random neighbour until neighbour not visited else remove current from stack
		var neighbours = self.get_surrounding_cells(current)
		while neighbours:
			wait(1)
			print("current neighbours: ", neighbours)
			next = neighbours.pop_at(randi() % neighbours.size())
			stack.append(next)
			print("check neighbour", next)
			if next not in visited.keys():
				# 3. create neighbor with open-back if doesn't exist else: open-back of neighbour
				if self.get_cell_atlas_coords(1, next) == EMTPY_TILE:
					# move 2 steps ahead, so the wall tile can be used to separate paths
					var direction = next - current
					var nextnext = next + direction
					self.set_cell(1, current,0,Vector2i(0,0),0)
					self.set_cell(1, next,0,Vector2i(0,0),0)
					self.set_cell(1, nextnext,0,Vector2i(0,0),0)
					visited[current] = ""
					visited[next] = ""
					visited[nextnext] = ""
					print("added tiles: ", current, next, nextnext)

	# 4. open-forward of current tile
	# 5. add neighbour to visited and stack
	# 6. go to 2.
	
	pass
