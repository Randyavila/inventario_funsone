class Estado < ActiveRecord::Base
  has_many :articulos
  belongs_to :articulos

  def estado=(value)
    write_attribute(:estado, value.mb_chars.upcase)
  end

end
