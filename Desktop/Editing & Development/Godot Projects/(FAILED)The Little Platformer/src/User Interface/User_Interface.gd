extends Control

@onready var scene_tree: = get_tree()
@onready var pause_overlay: ColorRect = $PauseOverlay
@onready var score_label: Label = $ScoreLabel
@onready var pause_label: Label = $PauseOverlay/PauseLabel

var paused: = false:
	set = set_paused 

func _ready() -> void:
	PlayerData.connect("score_updated", update_interface)
	PlayerData.connect("player_died", _on_PlayerData_player_died)
	update_interface()

func _on_PlayerData_player_died() -> void:
	self.paused = true
	pause_label.text = "You Died"

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause") and pause_label.text != "You Died":
		self.paused = !paused
		get_viewport().set_input_as_handled()

func update_interface():
	score_label.text = "Score: %s" % PlayerData.score

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
