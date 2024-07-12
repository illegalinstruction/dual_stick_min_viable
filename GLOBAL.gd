extends Node

#-------------------------------------------------------------------------------

const IDLE         : int = 0;
const JUST_PRESSED : int = 1;
const HELD         : int = 2;

#-------------------------------------------------------------------------------

export var ANALOGUE_DEAD_ZONE : float = 0.2;

#-------------------------------------------------------------------------------
# joypad vars
var JOY_STATES = [
	{
		"left_stick"    : Vector2(0,0),
		"right_stick"   : Vector2(0,0),
		"evade_button"  : int(0),
		"bomb_button"   : int(0),
		"portal_button" : int(0)
	},
	{
		"left_stick"    : Vector2(0,0),
		"right_stick"   : Vector2(0,0),
		"evade_button"  : int(0),
		"bomb_button"   : int(0),
		"portal_button" : int(0)
	}
];

var NUM_JOYS_DETECTED : int = 0;

#-------------------------------------------------------------------------------
# to be called anywhere the caller wants synchronous input in the last tick, but
# not events
func poll_joysticks():
	# how many joys connected right now?
	self.NUM_JOYS_DETECTED = Input.get_connected_joypads().size();
	
	for joy_index in range(0, NUM_JOYS_DETECTED):
		self.JOY_STATES[joy_index]["left_stick"].x  = Input.get_joy_axis(joy_index,JOY_ANALOG_LX);
		self.JOY_STATES[joy_index]["left_stick"].y  = Input.get_joy_axis(joy_index,JOY_ANALOG_LY);

		self.JOY_STATES[joy_index]["right_stick"].x = Input.get_joy_axis(joy_index,JOY_ANALOG_RX);
		self.JOY_STATES[joy_index]["right_stick"].y = Input.get_joy_axis(joy_index,JOY_ANALOG_RY);
		
		# "scroll of town portal" key
		if (Input.is_joy_button_pressed(joy_index, JOY_XBOX_X) or Input.is_joy_button_pressed(joy_index, JOY_XBOX_Y)):
			if (self.JOY_STATES[joy_index]["portal_button"] == IDLE):
				self.JOY_STATES[joy_index]["portal_button"] = JUST_PRESSED;
			else:
				self.JOY_STATES[joy_index]["portal_button"] = HELD;
		else:
			self.JOY_STATES[joy_index]["portal_button"] = IDLE;
			
		# "spell scroll" key
		if (Input.is_joy_button_pressed(joy_index, JOY_L) or Input.is_joy_button_pressed(joy_index, JOY_R)):
			if (self.JOY_STATES[joy_index]["evade_button"] == IDLE):
				self.JOY_STATES[joy_index]["evade_button"] = JUST_PRESSED;
			else:
				self.JOY_STATES[joy_index]["evade_button"] = HELD;
		else:
			self.JOY_STATES[joy_index]["evade_button"] = IDLE;

		# "spell scroll" key
		if (Input.is_joy_button_pressed(joy_index, JOY_L2) or Input.is_joy_button_pressed(joy_index, JOY_R2)):
			if (self.JOY_STATES[joy_index]["bomb_button"] == IDLE):
				self.JOY_STATES[joy_index]["bomb_button"] = JUST_PRESSED;
			else:
				self.JOY_STATES[joy_index]["bomb_button"] = HELD;
		else:
			self.JOY_STATES[joy_index]["bomb_button"] = IDLE;
	
	return;
