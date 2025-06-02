class_name GabreuIdleState
extends PlayerState

func enter() -> void:
	player.animation.play(idle_anim)
