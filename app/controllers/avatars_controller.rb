class AvatarsController < Devise::RegistrationsController

    private

    def sign_up_params
        params.require(:user).permit(:username,:email,:password,:password_confirmation,:avatar)
    end
end
