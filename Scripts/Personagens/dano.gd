extends Area2D
@onready var trigger_zone: Area2D = $Area2D

func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play('idle')


func _on_area_entered(area: Area2D) -> void:
	$AnimatedSprite2D.play('dano')
