class Burger < ApplicationRecord
    def nutriments
        @elements = []
        $value = []
        if Openfoodfacts::Product.get(self.code, locale: 'fr')
            @variable = Openfoodfacts::Product.get(self.code, locale: 'fr').nutriments.to_hash 
            @variable = @variable.to_s
            @variable.sub!("{", "")
            @variable.sub!("}", "")
            @variable.gsub!("\"", " ")
            @elements = @variable.split(",")
            for i in @elements
                $value = $value + "#{i}".split("=>")
        end
        return Openfoodfacts::Product.get(self.code, locale: 'fr').nutriments.to_hash       
        else
            return "Le code doit sûrement être erronné."
        end
    end
end
