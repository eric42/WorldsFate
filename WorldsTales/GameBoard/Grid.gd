class_name Grid 
extends Resource


# Declare member variables here.
#Grid size and columns
export var size := Vector2(20, 20)
#size of a cell in pixels
export var cell_size := Vector2(80, 80)

#half of a cell_size
#used to calculate the center of the cell in pixel, where 
#allows to place the unit in the center of the cell
var _half_cell_size := cell_size / 2

#returns the position of the cell's center
#this function will be used for the unit move through cells
func calculate_map_position(grid_position: Vector2) -> Vector2:
	return grid_position * cell_size + _half_cell_size

#return the coordinate of the cell on the grid given the
#position on the map
#is a complement for the function above
#will be used for the placement of the units by the design
#of the lvl, by returning the grid coordinates were they are
# placed and call the function above for get the center of grid
func calculate_grid_coordinates(map_position : Vector2) -> Vector2:
	return (map_position / cell_size).floor()

#return true if the "cell_coordinate" are inside the grid
#this function make sure the cursor or units are inside the map
func is_within_bounds(cell_coordinates : Vector2) -> bool:
	var out := cell_coordinates.x >= 0 and cell_coordinates.x < size.x
	return out and cell_coordinates.y >= 0 and cell_coordinates.y < size.y

#make the "grid_position" fit inside the grid's bound
func clamp(grid_position : Vector2) -> Vector2:
	var out := grid_position
	out.x = clamp(out.x, 0, size.x - 1.0)
	out.y = clamp(out.y, 0, size.y - 1.0)
	return out

# Given Vector2 coordinates, calculates and returns the corresponding integer index. You can use
# this function to convert 2D coordinates to a 1D array's indices.
func as_index(cell: Vector2) -> int:
	return int(cell.x + size.x * cell.y)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
