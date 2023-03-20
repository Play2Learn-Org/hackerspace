extends Node

signal placed_stairs(position: Vector2i, cell_quadrant_size: int)
signal placed_exit(position: Vector2i, cell_quadrant_size: int)
signal placed_door(position: Vector2i, cell_quadrant_size: int)
signal placed_key(position: Vector2i, cell_quadrant_size: int)
signal closed_door(position: Vector2i, cell_quadrant_size: int)
signal opened_door(position: Vector2i, cell_quadrant_size: int)
signal door_touched(status: String)

signal next_level
signal key_touched
signal door_opened
signal exit_reached
