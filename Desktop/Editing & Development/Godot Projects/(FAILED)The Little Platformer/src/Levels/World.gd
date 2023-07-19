extends Node2D

@onready var scene_tree: = get_tree()
#@onready var level_complete: CanvasLayer = $LevelComplete
#@onready var start_in: ColorRect = %StartIn
#@onready var start_in_label: Label = %StartInLabel
#@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var next_level: PackedScene

func _ready() -> void:
	Events.level_completed.connect(show_level_completed)
	scene_tree.paused = true
#	start_in.visible = true
#	await LevelTransition.fade_from_black()
#	animation_player.play("countdown")
#	await animation_player.animation_finished
	scene_tree.paused = false
#	start_in.visible = false
	RenderingServer.set_default_clear_color(Color.BLACK)

func show_level_completed():
#	level_complete.show()
	scene_tree.paused = true
	await scene_tree.create_timer(1.0).timeout
	if not next_level is PackedScene: return
	await LevelTransition.fade_to_black()
	scene_tree.paused = false
	get_tree().change_scene_to_packed(next_level)
