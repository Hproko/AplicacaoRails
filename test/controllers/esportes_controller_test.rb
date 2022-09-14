require "test_helper"

class EsportesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @esporte = esportes(:one)
    login
  end

  test "should get index" do
    get esportes_url
    assert_response :success
  end

  test "should get new" do
    get new_esporte_url
    assert_response :success
  end

  test "should create esporte" do
    assert_difference("Esporte.count") do
      post esportes_url, params: { esporte: { nome_esporte: @esporte.nome_esporte } }
    end

    assert_redirected_to esporte_url(Esporte.last)
  end

  test "should show esporte" do
    get esporte_url(@esporte)
    assert_response :success
  end

  test "should get edit" do
    get edit_esporte_url(@esporte)
    assert_response :success
  end

  test "should update esporte" do
    patch esporte_url(@esporte), params: { esporte: { nome_esporte: @esporte.nome_esporte } }
    assert_redirected_to esporte_url(@esporte)
  end

  test "should destroy esporte" do
    assert_difference("Esporte.count", -1) do
      delete esporte_url(@esporte)
    end

    assert_redirected_to esportes_url
  end
end
