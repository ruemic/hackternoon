# confirmations_controller.rb
	
class ConfirmationsController < Devise::ConfirmationsController

  # Control flows here when user follows URL in e-mail.
  def show
debugger
    @user = User.find_by_confirmation_token(params[:confirmation_token])
    if @user.blank?
      render :confirm_user_failed
    end
  end

  # Control flows here when user submits new-password to this form:
  # app/views/confirmations/show.html.haml
  def confirm_user
debugger
    @user = User.find_by_confirmation_token(params[:user][:confirmation_token])
    if @user.blank?
      render :confirm_user_failed
      return
    end      
    # Slim down the hash I send to Devise to avoid Mass-Update-problems:
    params_user = {'name' => params[:user][:name], 
                   'password' => params[:user][:password], 
                   'password_confirmation' => params[:user][:password_confirmation]
                  }
    if @user.update_attributes(params_user) and @user.password_match?
      @user = User.confirm_by_token(@user.confirmation_token)
      set_flash_message :notice, :confirmed      
      sign_in_and_redirect("user", @user)
    else
      render :confirm_user_failed
      return
    end # if
  end # def confirm_user

end
