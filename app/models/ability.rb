# frozen_string_literal: true


class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(Admin)
    elsif user.is_a?(Doctor)
      can [:read, :update], Record, doctor_id: user.id
    elsif user.is_a?(User)
      can [:read, :create], Record, user: user
    else
    end
  end
end
