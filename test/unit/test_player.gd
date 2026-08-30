extends GutTest

var player: Player

func before_each():
	player = autofree(Player.new())

func test_hp_max_floors_at_one():
	player.hp_max = 0
	assert_eq(player.hp_max, 1, "hp_max should never drop below 1")

func test_hp_clamps_to_hp_max():
	player.hp_max = 10
	player.hp = 999
	assert_eq(player.hp, 10, "hp should not exceed hp_max")

func test_hp_clamps_to_zero():
	player.hp = -5
	assert_eq(player.hp, 0, "hp should not go negative")

func test_mana_max_floors_at_zero():
	player.mana_max = -3
	assert_eq(player.mana_max, 0, "mana_max should never go negative")

func test_mana_clamps_to_mana_max():
	player.mana_max = 5
	player.mana = 999
	assert_eq(player.mana, 5, "mana should not exceed mana_max")

func test_mana_clamps_to_zero():
	player.mana = -5
	assert_eq(player.mana, 0, "mana should not go negative")

func test_mana_regen_floors_at_zero():
	player.mana_regen = -2
	assert_eq(player.mana_regen, 0, "mana_regen should never go negative")

func test_glyph_slots_floors_at_one():
	player.glyph_slots = 0
	assert_eq(player.glyph_slots, 1, "glyph_slots should never drop below 1")

func test_facing_normalizes_input():
	player.facing = Vector2(5, 0)
	assert_almost_eq(player.facing.length(), 1.0, 0.0001, "facing should always be a unit vector")

func test_facing_ignores_zero_vector():
	player.facing = Vector2(1, 0)
	player.facing = Vector2.ZERO
	assert_eq(player.facing, Vector2(1, 0), "facing should keep its last value rather than become zero")

func test_gravity_floors_at_zero():
	player.gravity = -1.0
	assert_eq(player.gravity, 0.0, "gravity multiplier should never go negative")
