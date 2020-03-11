class Burger < ApplicationRecord
    def nutriments
        @elements = []
        $value = []
        @variable = Openfoodfacts::Product.get(code, locale: 'fr').nutriments.to_hash
        @variable = @variable.to_s
        @variable.sub!("{", "")
        @variable.sub!("}", "")
        @variable.gsub!("\"", " ")
        @elements = @variable.split(",")
        for i in @elements
            $value = $value + "#{i}".split("=>")
        end
        return Openfoodfacts::Product.get(code, locale: 'fr').nutriments.to_hash
    end
end
