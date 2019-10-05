# frozen_string_literal: true

# == Schema Information
#
# Table name: levels
#
#  id           :bigint           not null, primary key
#  number       :integer
#  editorial_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string(255)
#

class Level < ApplicationRecord
  belongs_to :editorial
  has_many :units, dependent: :destroy
  has_many :multiple_questions, through: :units
  has_many :comprehension_questions, through: :units

  scope :available_levels_by_editorial, lambda { |editorial_id|
    where(editorial_id: editorial_id)
  }
end
