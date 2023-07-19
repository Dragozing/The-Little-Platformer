extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body: CharacterBody2D) -> void:
	var cards = get_tree().get_nodes_in_group("Cards")
	if cards.size() == 1:
		Events.level_completed.emit()
