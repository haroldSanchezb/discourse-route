# name: test route
# about: testing
# version: 0.1
# authors: haroldsanchezb

after_initialize do
	DiscourseRouteController.class_eval do
		skip_before_filter :check_xhr, only: ['sso', 'sso_login', 'become', 'sso_provider', 'route_redirect']

		def route_redirect
			redirect_to "/"
		end
	end

	Discourse::Application.routes.append do
		get "testing" => "discourse_route#route_redirect"
	end
end