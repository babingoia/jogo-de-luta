extends CharacterBody2D

class_name Gravidade
const ACELERACAO = 10

func calcular_queda():
	if(!is_on_floor()):
		velocity.y += ACELERACAO
	else:
		velocity.y = 0
