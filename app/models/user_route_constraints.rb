class UserRouteConstraints
  def matches?(request)
    not request.params[:nickname].include?('boards')
    not request.params[:nickname].include?('results')
    not request.params[:nickname].include?('sign_in')
  end
end
