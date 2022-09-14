class Documento < ActiveRecord::Base
    validate :cpf_tem_tamanho_11, :cpf_somente_numeros, :rg_tem_tamanho_menor_13, :rg_somente_numeros

    belongs_to:pessoa, :dependent => :destroy

    def cpf_tem_tamanho_11
        if cpf.size != 11
            errors.add(:cpf, "deve ter 11 digitos")
        end
    end

    def cpf_somente_numeros
        if !cpf.match(/\A[[:digit:]]+\z/)
            errors.add(:cpf, "deve ter apenas números")
        end
    end

    def rg_tem_tamanho_menor_13
        if rg.size != 8
            errors.add(:rg, "deve ter 8 digitos")
        end
    end

    def rg_somente_numeros
        if !rg.match(/\A[[:digit:]]+\z/)
            errors.add(:rg, "deve ter apenas números")
        end
    end


end
