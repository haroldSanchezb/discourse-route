# name: test route
# about: testing
# version: 0.1
# authors: haroldsanchezb

after_initialize do
	RouteController.class_eval do
		skip_before_filter :check_xhr, only: ['sso', 'sso_login', 'become', 'sso_provider', 'redirect']

		def redirect
				redirect_to "/"
			end
		end
	end

	Discourse::Application.routes.append do
		get "testing" => "route#redirect"
	end
end