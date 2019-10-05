# frozen_string_literal: true

# == Schema Information
#
# Table name: employees
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  area       :string(255)
#  position   :string(255)
#  signing    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employee < ApplicationRecord
  has_and_belongs_to_many :certificates
end
