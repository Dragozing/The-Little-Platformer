extends Area2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@export var score = 25

func _on_body_entered(_body: Node2D) -> void:
	picked()

func picked() -> void:
	anim_player.play("fade_out")
	PlayerData.score += score
