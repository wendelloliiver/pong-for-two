extends Node
class_name  GlobalConfig

enum GAME_STATE { MENU, SERVER, PLAY }
var current_state = GAME_STATE.MENU

const SCORE_MAX = 3

var score_rqt_left  = 0
var score_rqt_right = 0

var ball_direction = Vector2.LEFT
