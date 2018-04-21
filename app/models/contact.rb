class Contact < ApplicationRecord

  belongs_to :kind, optional: true
  has_many :phones
  accepts_nested_attributes_for :phones

  # def to_pt
  #   { name: self.name,
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #    }
  # end

  # def author
  #   "Sergio Alves"
  # end

  # def kind_description
  #   self.kind.description
  # end

  def as_json(options={})
    h = super(options)
    h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    h
  end

  # def hello
  #   I18n.t('hello')
  # end

  # def i18n
  #   I18n.default_locale
  # end
end
