extends Node2D

# based on https://www.youtube.com/watch?v=YShYWaGF3Nc

const NORTH = 1
const SOUTH = 2
const WEST = 4
const EAST = 8

var cell_walls = {
	Vector2(0, -1): NORTH,
	Vector2(0, 1): SOUTH,
	Vector2(-1, 0): WEST,
	Vector2(1, 0): EAST,
}

var tile_size = 100
var width = 25
var height = 25

@onready
var Map = $TileMap

func _ready():
	randomize()
	tile_size = Map.get_cell_size
	make_maze()

func check_neighbours(cell, unvisited):
	# figure out unvisited neighbours of cell given
	# TODO: will this function be necessary in my solution?
	return null

func make_maze():
	# TODO: start somewhere, reasonably (0,0)
	# TODO: choose a new, random, unvisited neighbour
	# TODO: connect current and new node without modifying other walls in either
	# TODO: set new node as current and goto step 2 until no more unvisited neighbours
	# TODO: return to previous current node and goto step 2 until no more previous current nodes exist
	# done
	pass
