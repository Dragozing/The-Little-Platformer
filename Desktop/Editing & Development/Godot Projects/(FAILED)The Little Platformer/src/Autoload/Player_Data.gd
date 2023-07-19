extends Node

signal score_updated
signal player_died
signal cards_collected

var score: int = 0:
	set = set_score
var deaths: int = 0:
	set = set_death
var cards: int = 0:
	set = set_cards

func reset() -> void:
	score = 0
	deaths = 0

func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")

func set_death(value: int) -> void:
	deaths = value
	emit_signal("player_died")

func set_cards(value: int) -> void:
	cards = value
	emit_signal("cards_collected")
