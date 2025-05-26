extends Gravidade

# Controles
@export var direita = "left"
@export var esquerda = "right"
@export var pulo = "up"
@export var abaixar = "down"
@export var ataque_leve = "ataque_leve"
@export var ataque_pesado = "ataque_pesado"

# Outras variaveis
@export var speed = 400
		
func controle_anim():
	if Input.is_action_just_pressed("ataque_leve"):
		$AnimatedSprite2D.play('soco')
		
func get_input():
	calcular_queda()
	velocity.x = 0
	if(Input.is_action_pressed("left")):
		velocity.x = -1
		$AnimatedSprite2D.scale.x = 1
		$HitboxBraco.scale.x = 1
	if(Input.is_action_pressed("right")):
		velocity.x = 1
		$AnimatedSprite2D.scale.x = -1
		$HitboxBraco.scale.x = -1
	if(Input.is_action_just_pressed("up")) && (is_on_floor()):
		velocity.y = -1
		velocity.y *= speed
	velocity.x *= speed
	


func _ready() -> void:
	$HitboxBraco.monitorable = false


func _physics_process(delta):
	controle_anim()
	get_input()
	move_and_slide()


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.

func _on_animated_sprite_2d_animation_finished() -> void:
	if ($AnimatedSprite2D.animation == 'soco'):
		$AnimatedSprite2D.play("default")
		$HitboxBraco.monitorable = false


func _on_animated_sprite_2d_animation_changed() -> void:
	if ($AnimatedSprite2D.animation == 'soco'):
		$HitboxBraco.monitorable = true
