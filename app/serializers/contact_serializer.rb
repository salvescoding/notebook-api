class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) { kind_url(object.kind.id) }
  end
  has_many :phones
  has_one :address

  link(:self) { contact_url(object.id) }

  def attributes(*args)
    h = super(*args)
    # PT time : h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end


  meta do
    { author: "Salves" }
  end
end
