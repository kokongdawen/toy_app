require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Beng beng beng"
    assert_equal full_title("Help"), "Help | Beng beng beng"
  end

end
