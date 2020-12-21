module Findable

    def find_by_id(id)
        self.all.each do |p|
            return p.name if p.id == id
        end
    end

end