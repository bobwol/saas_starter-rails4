ProjectPolicy = Struct.new(:user, :project) do
  self::Scope = Struct.new(:user, :scope) do
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(:published => true)
      end
    end
  end

  def create?
    user.admin? or not project.published?
  end
end
