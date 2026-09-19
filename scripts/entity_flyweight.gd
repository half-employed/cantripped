#Entity flyweight meaning the blueprint/template for all entities that will be created in the game
class_name EntityFlyweight
extends Resource

@export var id: int
@export var entity_name: String
@export var sprite_frames: SpriteFrames
@export var hp_max: int = 1

var ref_count: int = 0
