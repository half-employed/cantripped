class_name EntityFlyweight
extends Resource

# Exported dictionary that will be used to contain EntityFlyweights created at runtime
@export var runtime_flyweights: Dictionary = {}

@export var id: int
@export var spritemap: Resource # Note: Typed as Resource until SpriteMap class is available
@export var name: String
@export var hp_max: int = 1
@export var ref_count: int = 0
