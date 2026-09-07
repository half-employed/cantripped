extends CharacterBody2D
class_name Player
# Player's exported stats and attributes (hp, mana, glyph slots, facing, gravity, spells), with validated setters

# position and velocity attributes are already builtin from CharacterBody2D extension
## position: 2d vector of player position in level
## velocity: 2d vector 

@export var hp_max: int = 10:
	set(value):
		hp_max = maxi(value, 1)

@export var hp: int = 10:
	set(value):
		hp = clampi(value, 0, hp_max)

@export var mana_max: int = 10:
	set(value):
		mana_max = maxi(value, 0)

@export var mana: int = 10:
	set(value):
		mana = clampi(value, 0, mana_max)

@export var mana_regen: int = 1:
	set(value):
		mana_regen = maxi(value, 0)

@export var glyph_slots: int = 1: # max number of glyphs a spell can have
	set(value):
		glyph_slots = maxi(value, 1)

@export var sprite: Sprite2D

@export var facing: Vector2 = Vector2.DOWN: # unit vector for where the player is facing
	set(value):
		facing = value.normalized() if value != Vector2.ZERO else facing

@export var gravity: float = 1.0: # float multiplier for how fast the player falls
	set(value):
		gravity = maxf(value, 0.0)

@export var speed: float = 200.0: # lateral movement speed in pixels/second
	set(value):
		speed = maxf(value, 0.0)

@export var spells: Array = [] # array holding references to spells
# array untyped, loose for now

func _physics_process(_delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed

	move_and_slide()
