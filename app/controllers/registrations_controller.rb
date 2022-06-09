class RegistrationsController < Devise::RegistrationsController
  # def create
  #   session["#{resource_name}_return_to"] = edit_profile_path(@profile)
  #   super
  # end

  protected

  def after_sign_up_path_for(resource)
    edit_profile_path
  end
end
