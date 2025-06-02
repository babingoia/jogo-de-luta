class_name Player
extends Gravidade

#libs
@onready var state_machine: StateMachine = $"StateMachine"
@onready var animation: AnimationPlayer = $Animation
@onready var sprite: AnimatedSprite2D = $Sprite

# Controles
@export var direita = "left"
@export var esquerda = "right"
@export var pulo = "up"
@export var abaixar = "down"
@export var ataque_leve = "ataque_leve"
@export var ataque_pesado = "ataque_pesado"

# Outras variaveis
@export var speed = 400


func get_input():
	calcular_queda()
	velocity.x = 0
	if(Input.is_action_pressed("left")):
		velocity.x = -1
		sprite.flip_h = false
	if(Input.is_action_pressed("right")):
		velocity.x = 1
		sprite.flip_h = true
	if(Input.is_action_just_pressed("up")) && (is_on_floor()):
		velocity.y = -1
		velocity.y *= speed
	velocity.x *= speed


func _ready() -> void: state_machine.init()


func _physics_process(delta):
	state_machine.process_physics(delta)
	get_input()
	move_and_slide()


func _process(delta: float) -> void: state_machine.process_frame(delta)


func _input(event): state_machine.process_input(event)
