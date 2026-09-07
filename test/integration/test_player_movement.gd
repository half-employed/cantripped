extends GutTest

var player: Player
var sender: GutInputSender

func before_each():
	player = add_child_autofree(Player.new())
	sender = InputSender.new(Input)

func after_each():
	sender.release_all()
	sender.clear()

func test_falls_when_airborne():
	simulate(player, 10, 1.0 / 60.0)
	assert_gt(player.velocity.y, 0.0, "velocity.y should increase while airborne")

func test_higher_gravity_multiplier_falls_faster():
	player.gravity = 2.0
	simulate(player, 10, 1.0 / 60.0)
	var fast_fall := player.velocity.y

	player.velocity.y = 0.0
	player.gravity = 1.0
	simulate(player, 10, 1.0 / 60.0)
	var normal_fall := player.velocity.y

	assert_gt(fast_fall, normal_fall, "higher gravity multiplier should fall faster than default")

func test_moves_right_on_move_right_action():
	sender.action_down("move_right")
	simulate(player, 1, 1.0 / 60.0)
	assert_gt(player.velocity.x, 0.0, "velocity.x should be positive when move_right is held")

func test_moves_left_on_move_left_action():
	sender.action_down("move_left")
	simulate(player, 1, 1.0 / 60.0)
	assert_lt(player.velocity.x, 0.0, "velocity.x should be negative when move_left is held")

func test_no_lateral_velocity_without_input():
	simulate(player, 1, 1.0 / 60.0)
	assert_eq(player.velocity.x, 0.0, "velocity.x should stay zero with no movement input")

func test_speed_scales_lateral_velocity():
	player.speed = 500.0
	sender.action_down("move_right")
	simulate(player, 1, 1.0 / 60.0)
	assert_almost_eq(player.velocity.x, 500.0, 0.01, "velocity.x should match speed when moving right at full input")
