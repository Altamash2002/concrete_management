class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Our Application')
  end

  # def grey_values_email(user, grey_values)
  #   @user = user
  #   @grey_values = grey_values
  #   mail(to: @user.email, subject: 'Alert Grey Values')
  # end

  # def red_values_email(user, red_values)
  #   @user = user
  #   @red_values = red_values
  #   mail(to: @user.email, subject: 'Alert red Values')
  # end
  # def red_values_email(user, red_values, green_values)
  #   @user = user
  #   @red_values = red_values
  #   @green_values = green_values
  #   mail(to: @user.email, subject: 'Alert red Values')
  # end 
  def red_values_email(user, red_values)
    @user = user
    @red_values = red_values
    mail(to: @user.email, subject: 'Alert red Values')
  end

 

  def grey_values_email(user, grey_values)
    @user = user
    @grey_values = grey_values
    mail(to: @user.email, subject: 'Alert Grey Values')
  end
  
  
  
end

 