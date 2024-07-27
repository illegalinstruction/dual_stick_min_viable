extends Node;

#-------------------------------------------------------------------------------

const LEVEL_SIZE : int = 64;

const ROOMTYPE_BLOCKED                     : int = 0;
const ROOMTYPE_EMPTY                       : int = 1;
const ROOMTYPE_STAIRCASE_UP                : int = 2;
const ROOMTYPE_STAIRCASE_DOWN              : int = 3;
const ROOMTYPE_STAIRCASE_MONSTER           : int = 4;
const ROOMTYPE_STAIRCASE_CHEST             : int = 5;
const ROOMTYPE_STAIRCASE_MIMIC             : int = 6;
const ROOMTYPE_STAIRCASE_HEALING_SPRING    : int = 7;

#-------------------------------------------------------------------------------

var current_level = [];

#-------------------------------------------------------------------------------

func clear_level_map():
	for y_index in range(LEVEL_SIZE): 
		for x_index in range(LEVEL_SIZE): 
			current_level[y_index][x_index] = ROOMTYPE_BLOCKED;
	return;

#-------------------------------------------------------------------------------

func _ready():
	# init the level with all nonpassable squares.
	for y_index in range(LEVEL_SIZE): 
		current_level.append([]);
		for x_index in range(LEVEL_SIZE): 
			current_level[y_index].append(ROOMTYPE_BLOCKED);	
	pass
