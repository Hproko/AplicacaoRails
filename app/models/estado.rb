class Estado < ActiveRecord::Base
    validate :nome_apenas_caracteres, :sigla_apenas_caracteres, :sigla_tamanho_dois

    has_many :pessoas, :dependent => :destroy

    def nome_apenas_caracteres
        if !nome.match(/\A[[:alpha:]||[:blank:]]+\z/)
            errors.add(:nome, "do estado deve ter apenas letras")
        end
    end

    def sigla_apenas_caracteres
        if !sigla.match(/\A[[:alpha:]]+\z/)
            errors.add(:sigla, "deve ter apenas caracteres")
        end
    end

    def sigla_tamanho_dois
        if sigla.size != 2
            errors.add(:sigla, "deve ter tamanho 2")
        end
    end

end
