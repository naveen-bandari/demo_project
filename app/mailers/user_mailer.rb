class UserMailer < ApplicationMailer
  def send_welcome_email(id)
    @user = User.find_by(id: id)
    puts "========user:::: #{@user}"
    url  = 'http://example.com/login'
    @short_url =  Short::UrlGenerator.generate_short_url(url)
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def notify_profile_update(id)
  	@user = User.find_by(id: id)
  	mail(to: @user.email, subject: 'Warning: Profile updated')  	
  end
end
