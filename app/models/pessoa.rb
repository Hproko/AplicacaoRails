class Pessoa < ActiveRecord::Base
    validate :nome_apenas_caracteres, :sobrenome_apenas_caracteres

    belongs_to :estado
    has_one :documento, :dependent => :destroy
    has_and_belongs_to_many :esportes, ->{distinct}

    def nome_apenas_caracteres
        if !nome.match(/\A[[:alpha:]]+\z/)
            errors.add(:nome, "deve ter apenas caracteres")
        end
    end

    def sobrenome_apenas_caracteres
        if !sobrenome.match(/\A[[:alpha:]||[:blank:]]+\z/)
            errors.add(:sobrenome, "deve ter apenas caracteres")
        end
    end

end
