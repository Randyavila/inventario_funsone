class Estado < ActiveRecord::Base
  has_many :articulos
  belongs_to :articulos

  validates :estado, presence: { message: "- Debe ingresar un estado o status nuevo" }


  def estado=(value)
    write_attribute(:estado, value.mb_chars.upcase)
  end

end
