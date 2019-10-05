# frozen_string_literal: true

module ApplicationHelper
  def actual_users
    User.kept
  end

  def discarded_users
    User.discarded
  end
end
