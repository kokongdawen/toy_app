require 'test_helper'

class JugueteTest < ActiveSupport::TestCase
  def setup
    @user = users(:darrem)
    @juguete = @user.juguetes.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @juguete.valid?
  end

  test "user id should be present" do
    @juguete.user_id = nil
    assert_not @juguete.valid?
  end

  test "content should be present" do
    @juguete.content = "     "
    assert_not @juguete.valid?
  end

  test "content should be at most 140 characters" do
    @juguete.content = "a" * 141
    assert_not @juguete.valid?
  end

  test "order should be most recent first" do
    assert_equal juguetes(:most_recent), Juguete.first
  end
end
