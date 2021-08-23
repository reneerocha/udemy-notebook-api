class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones
    has_one :address

    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :address, update_only: true

    def as_json(options={})
         h = super(options)
         h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
        h
    end
    # def author
    #     "Renee"
    # end

    # def kind_description
    #     self.kind.description
    # end

    # def as_json(options={})
    #     super(
    #         root: true,
    #         methods: [:kind_description, :author]            
    #         )
    # end

end
