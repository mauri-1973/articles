class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
  def after_sign_in_path_for(resource)
    # Aquí defino que todos los usuarios vayan a la página principal de posts por ejemplo
    posts_path  # Asumiendo que tienes una ruta llamada 'posts_path'
    # Puedes usar cualquier ruta que necesites
  end

	def configure_permitted_parameters

		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo])

		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :photo])

	end
end
