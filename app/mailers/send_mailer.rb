class SendMailer < ApplicationMailer
	default from: "contacto@dqmuebles.cl"
	def sample_email(user, pass)
	  @user = user
	  @pass = pass
	  mail(to: @user.email, subject: 'Cuenta AeroClassVip')
	end

	def password_email(user, pass)
	  @user = user
	  @pass = pass
	  mail(to: @user.email, subject: 'Nueva cotraseña AeroClassVip')
	end
end