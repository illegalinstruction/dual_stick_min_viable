extends Node

#-------------------------------------------------------------------------------

export var ANALOGUE_DEAD_ZONE : float = 0.125;

#-------------------------------------------------------------------------------
# joypad vars
var JOY_STATES : Dictionary = {
	"PLAYER_1" : {
		"left_x"       : 0.0,
		"left_y"       : 0.0,
		"left_angle"   : 0.0,
		"left_dist"    : 0.0,
		"right_x"      : 0.0,
		"right_y"      : 0.0,
		"right_angle"  : 0.0,
		"right_dist"   : 0.0,
		"evade_button" : int(0),
		"bomb_button"  : int(0)
	},
	"PLAYER_2" : {
		"left_x"       : 0.0,
		"left_y"       : 0.0,
		"left_angle"   : 0.0,
		"left_dist"    : 0.0,
		"right_x"      : 0.0,
		"right_y"      : 0.0,
		"right_angle"  : 0.0,
		"right_dist"   : 0.0,
		"evade_button" : int(0),
		"bomb_button"  : int(0)
	}
};

#-------------------------------------------------------------------------------

func process(_ignore):
	return;
