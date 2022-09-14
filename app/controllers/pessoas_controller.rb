class PessoasController < ApplicationController
  before_action :authorize
  before_action :admin?, except: [:index, :show]
  before_action :set_pessoa, only: %i[ show edit update destroy ]

  # GET /pessoas or /pessoas.json
  def index
    @pessoas = Pessoa.all
  end

  # GET /pessoas/1 or /pessoas/1.json
  def show
    
    @documento = Documento.find_by(pessoa_id: @pessoa.id)
    @esportes = @pessoa.esportes
    @estado = @pessoa.estado

  end

  # GET /pessoas/new
  def new
    @pessoa = Pessoa.new
  end

  # GET /pessoas/1/edit
  def edit  
  end

  # POST /pessoas or /pessoas.json
  def create
    @pessoa = Pessoa.new

    @pessoa.nome = pessoa_params[:nome].titleize
    @pessoa.sobrenome = pessoa_params[:sobrenome].titleize
    
    estado = Estado.find_by(sigla: pessoa_params[:sigla])

    @pessoa.estado = estado

    documento = Documento.new
    
    documento.rg = pessoa_params[:rg] 
    
    documento.cpf = pessoa_params[:cpf]

    @pessoa.documento = documento

    pessoa_params[:esporte_ids].each do |e|
      if e == ""
        next
      end
      esp = Esporte.find(e)
      if esp != nil
        @pessoa.esportes << esp
      end
    end

    
    respond_to do |format|
      if documento.save
        if @pessoa.save
          format.html { redirect_to pessoa_url(@pessoa), notice: "Pessoa criada com sucesso" }
          format.json { render :show, status: :created, location: @pessoa }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @pessoa.errors, status: :unprocessable_entity }
        end
      else
        documento.errors.each do |e|
          @pessoa.errors.add(:documento, e.full_message)
        end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /pessoas/1 or /pessoas/1.json
  def update

    @pessoa.nome = pessoa_params[:nome].titleize
    @pessoa.sobrenome = pessoa_params[:sobrenome].titleize
    @estado = Estado.find_by(:sigla => pessoa_params[:sigla])
    
    documento = @pessoa.documento

    @pessoa.esportes.clear
    
    pessoa_params[:esporte_ids].each do |e|
      if e == ""
        next
      end
      esp = Esporte.find(e)
      if esp != nil
        @pessoa.esportes << esp
      end
    end
    

    respond_to do |format|
      if documento.update({:rg => pessoa_params[:rg], :cpf => pessoa_params[:cpf]})
        if @pessoa.update({:nome => pessoa_params[:nome], :sobrenome => pessoa_params[:sobrenome], :estado => @estado})
          format.html { redirect_to pessoa_url(@pessoa), notice: "Pessoa atualizada com sucesso." }
          format.json { render :show, status: :ok, location: @pessoa }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @pessoa.errors, status: :unprocessable_entity }
        end
      else
        documento.errors.each do |e|
          @pessoa.errors.add(:documento, e.full_message)
        end
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas/1 or /pessoas/1.json
  def destroy
    @pessoa.destroy

    respond_to do |format|
      format.html { redirect_to pessoas_url, notice: "Pessoa destruida com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa
      @pessoa = Pessoa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pessoa_params
      params.require(:pessoa).permit(:nome, :sobrenome, :rg, :cpf, :sigla, esporte_ids: [])
    end

  end