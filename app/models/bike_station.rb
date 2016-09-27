class BikeStation < ApplicationRecord
    acts_as_gmappable

    def gmaps4rails_infowindow
    end

    def gmaps4rails_address
        "#{longitude}, #{latitude}"
    end
end
