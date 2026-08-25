## Glyph
## Base class for all glyphs (Form, Action, Modifier).
## Concrete glyphs should extend this and override `cast()`.
class_name Glyph
extends Resource

## What role this glyph plays in a spell composition.
enum Kind {
	FORM,
	ACTION,
	MODIFIER,
}

@export var id: StringName
@export var glyph_name: String
@export var sprite: Texture2D
@export var sound: AudioStream
@export var is_unlocked: bool = false

@export_multiline var description: String = ""

@export var kind: Kind = Kind.FORM

## Called every iteration of the spellcasting state machine 
func cast(state) -> void:
	push_warning("cast() not implemented for glyph: %s" % id) #temporary error message
