class Esporte < ActiveRecord::Base
    validate :nome_apenas_caracteres

    has_and_belongs_to_many :pessoas,->{distinct}

    def nome_apenas_caracteres
        if !nome_esporte.match(/\A[[:alpha:]||[:blank:]]+\z/)
            errors.add(:nome, "Nome do esporte deve ter apenas caracteres")
        end
    end
end
