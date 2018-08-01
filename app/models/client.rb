class Client < ApplicationRecord
	has_many :services

	validates_uniqueness_of :phone, :message => 'El teléfono ingresado ya existe en la base de datos'
	validates_presence_of :phone, :message => 'Debe ingresar el Teléfono'
	validates_presence_of :name, :message => 'Debe ingresar el Nombre'
	validates_presence_of :last_name, :message => 'Debe ingresar el Apellido'

	def full_name
		[name, last_name].select(&:present?).join(' ').titleize
	end
end
