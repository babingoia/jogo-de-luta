extends Gravidade

@export var speed = 400
var trava_animacao = false
		
func controle_anim():
	if Input.is_action_just_pressed("ataque_leve") && not trava_animacao:
		trava_animacao = true
		$AnimatedSprite2D.play('soco')
	if not trava_animacao:
		$AnimatedSprite2D.play('default')
		
func get_input():
	calcular_queda()
	velocity.x = 0
	if(Input.is_action_pressed("left")):
		velocity.x = -1
		$AnimatedSprite2D.scale.x = 1
	if(Input.is_action_pressed("right")):
		velocity.x = 1
		$AnimatedSprite2D.scale.x = -1
	if(Input.is_action_just_pressed("up")) && (is_on_floor()):
		velocity.y = -1
		velocity.y *= speed
	velocity.x *= speed
	

func animacao_finalizada():
	if ($AnimatedSprite2D.animation == "soco"):
		trava_animacao = false


func _ready() -> void:
	if ($AnimatedSprite2D): 
		$AnimatedSprite2D.connect("animation_finished", Callable(self, "animacao_finalizada"))


func _physics_process(delta):
	controle_anim()
	get_input()
	move_and_slide()
