extends Button

@export var next_level: PackedScene



func _on_pressed() -> void:
	if not next_level is PackedScene: return
	get_tree().change_scene_to_packed(next_level)
