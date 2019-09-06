require 'test_helper'

class JuguetesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @juguete = juguetes(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Juguete.count' do
      post juguetes_path, params: { juguete: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Juguete.count' do
      delete juguete_path(@juguete)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong toy" do
    log_in_as(users(:walang))
    juguete = juguetes(:ants)
    assert_no_difference 'Juguete.count' do
      delete juguete_path(juguete)
    end
    assert_redirected_to root_url
  end
end
