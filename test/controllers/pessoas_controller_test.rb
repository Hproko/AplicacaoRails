require "test_helper"

class PessoasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pessoa = pessoas(:one)

    login
    e = Estado.new({:sigla => "AM", :nome => "Amazonas"})
    e.save

    @documento = Documento.find_by(pessoa_id: @pessoa.id)

  end

  test "should get index" do
    get pessoas_url
    assert_response :success
  end

  test "should get new" do
    get new_pessoa_url
    assert_response :success
  end

  test "should create pessoa" do
    assert_difference("Pessoa.count") do
      post pessoas_url, params: { pessoa: { nome: @pessoa.nome, sobrenome: @pessoa.sobrenome, sigla: "AM", rg: 73548732, cpf: 67835784756, esporte_ids: []} }
    end
    assert_redirected_to pessoa_url(Pessoa.last)
  end

  test "should show pessoa" do
    @pessoa = Pessoa.new({:nome => @pessoa.nome, :sobrenome => @pessoa.sobrenome})
    @pessoa.estado = Estado.find_by(sigla: "AM")
    documento = Documento.new ({:rg => 73548732, :cpf => 67835784756})
    @pessoa.documento = documento
    documento.save
    @pessoa.save

    get pessoa_url(@pessoa)
    assert_response :success
  end


  test "should update pessoa" do
    documento = Documento.new ({:rg => 73548732, :cpf => 67835784756})
    @pessoa.documento = documento
    documento.save
    patch pessoa_url(@pessoa), params: { pessoa: { nome: @pessoa.nome, sobrenome: @pessoa.sobrenome, sigla: "AM", rg: 73548731, cpf: 67835784754, esporte_ids: []} }
    assert_redirected_to pessoa_url(@pessoa)
  end

  test "should destroy pessoa" do
    assert_difference("Pessoa.count", -1) do
      delete pessoa_url(@pessoa)
    end

    assert_redirected_to pessoas_url
  end
end
