# User Profile
class UsersController < SessionsController
  before_filter :authenticate_user!

  def show
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(white_listed_parameters)
      flash[:notice] = 'Profile updated'
      redirect_to user_path
    else
      render user_path
    end
  end

  private

  def white_listed_parameters
    params
      .require(:user)
      .permit(:first_name,
        :last_name,
        :email,
        :contact_number, 
        :address_1,
        :address_2,
        :city,
        :state,
        :country,
        :postcode
        )
  end
end
