extends GutTest

func before_all():
	gut.p("Before All", 2)

func before_each():
	gut.p("Before Each", 2)

func after_each():
	gut.p("After Each", 2)

func after_all():
	gut.p("After All", 2)

func test_assert_eq_number_not_equal():
	assert_eq(1, 2, "Should fail.  1 != 2")

func test_assert_eq_number_equal():
	assert_eq('asdf', 'asdf', "Should pass")

func test_assert_true_with_true():
	assert_true(true, "Should pass, true is true")

func test_assert_true_with_false():
	assert_true(false, "Should fail")

func test_something_else():
	assert_true(false, "didn't work")
