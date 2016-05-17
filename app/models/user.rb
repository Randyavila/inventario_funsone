class User < ActiveRecord::Base

  has_many :articulos

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(usuario) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:usuario) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def nombre=(value)
    write_attribute(:nombre, value.mb_chars.upcase)
  end

  def apelliido=(value)
    write_attribute(:apellido, value.mb_chars.upcase)
  end

ROLES = %w[admin regular]


  def role_symbols
    #[role.to_sym]
    roles.map do |role|
      role.name.underscope.to_sym
    end
  end

  def roles=(roles)
    self.role = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sun
  end

  def roles
    ROLES.reject { |r|   ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero? }
    end


  def role?(role)
    roles.include? role.to_s
  end


end
