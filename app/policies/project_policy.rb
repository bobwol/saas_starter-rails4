ProjectPolicy = Struct.new(:user, :project) do
  self::Scope = Struct.new(:user, :scope) do
    def resolve
      scope.where(user_id: user)
    end
  end
  
  def create?
    case user.subscription.plan_id
    when 1                # Basic
      projects = 5
    when 2                # Advanced
      projects = 10
    when 3                # Deluxe
      projects = 15
    else                  # None
      projects = 0
    end
    
    true if user.projects.count < projects
  end
end
