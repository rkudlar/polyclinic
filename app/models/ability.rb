# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user
    when Doctor
      can %i[read update], Record, doctor_id: user.id
    when User
      can %i[read create], Record, user: user
    end
  end
end
