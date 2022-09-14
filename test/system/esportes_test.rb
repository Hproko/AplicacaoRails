require "application_system_test_case"

class EsportesTest < ApplicationSystemTestCase
  setup do
    @esporte = esportes(:one)
  end

  test "visiting the index" do
    visit esportes_url
    assert_selector "h1", text: "Esportes"
  end

  test "should create esporte" do
    visit esportes_url
    click_on "New esporte"

    fill_in "Nome esporte", with: @esporte.nome_esporte
    click_on "Create Esporte"

    assert_text "Esporte was successfully created"
    click_on "Back"
  end

  test "should update Esporte" do
    visit esporte_url(@esporte)
    click_on "Edit this esporte", match: :first

    fill_in "Nome esporte", with: @esporte.nome_esporte
    click_on "Update Esporte"

    assert_text "Esporte was successfully updated"
    click_on "Back"
  end

  test "should destroy Esporte" do
    visit esporte_url(@esporte)
    click_on "Destroy this esporte", match: :first

    assert_text "Esporte was successfully destroyed"
  end
end
