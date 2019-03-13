class UserRouteConstraints
  def matches?(request)
    not request.params[:nickname].include?('boards')
    not request.params[:nickname].include?('results')
  end
end
