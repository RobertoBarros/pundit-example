class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(user: user).or(scope.where(published: true))
    end
  end

  def show?
    true
  end

  def edit?
    record.user == user || user.admin?
  end

  def update?
    record.user == user || user.admin?
  end

  def destroy?
    user.admin?
  end

  def permitted_attributes
    if user.admin?
      [:name, :address, :published]
    else
      [:name, :address]
    end
  end

end
