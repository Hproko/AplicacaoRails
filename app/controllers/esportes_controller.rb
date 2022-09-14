class EsportesController < ApplicationController
  before_action :authorize
  before_action :admin?, except: [:index, :show]
  before_action :set_esporte, only: %i[ show edit update destroy ]

  # GET /esportes or /esportes.json
  def index
    @esportes = Esporte.all
  end

  # GET /esportes/1 or /esportes/1.json
  def show
    @pessoas = @esporte.pessoas
    
  end

  # GET /esportes/new
  def new
    @esporte = Esporte.new
  end

  # GET /esportes/1/edit
  def edit
  end

  # POST /esportes or /esportes.json
  def create
    @esporte = Esporte.new(esporte_params)
    @esporte.nome_esporte = @esporte.nome_esporte.titleize
    respond_to do |format|
      if @esporte.save
        format.html { redirect_to esporte_url(@esporte), notice: "Esporte criado com sucesso." }
        format.json { render :show, status: :created, location: @esporte }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @esporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /esportes/1 or /esportes/1.json
  def update
    
    respond_to do |format|
      if @esporte.update(:nome_esporte => esporte_params[:nome_esporte].titleize)
        format.html { redirect_to esporte_url(@esporte), notice: "Esporte atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @esporte }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @esporte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /esportes/1 or /esportes/1.json
  def destroy
    @esporte.destroy

    respond_to do |format|
      format.html { redirect_to esportes_url, notice: "Esporte destruido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_esporte
      @esporte = Esporte.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def esporte_params
      params.require(:esporte).permit(:nome_esporte)
    end
end
