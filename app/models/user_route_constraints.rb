class UserRouteConstraints
  def matches?(request)
    not ['boards', 'results', 'welcome', 'collaborations'].include?(request.params[:nickname])
  end
end
