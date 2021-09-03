class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if current_user.is_band
      new_tour_path
    else
      new_venue_path
    end
  end
end
