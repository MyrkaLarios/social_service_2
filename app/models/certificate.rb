# frozen_string_literal: true

# == Schema Information
#
# Table name: certificates
#
#  id                   :bigint           not null, primary key
#  date                 :date
#  exam_id              :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  certificate_parts_id :bigint(8)
#  status               :string(1)
#

class Certificate < ApplicationRecord
  include Discard::Model

  validates :exam_id, presence: true
  validates :certificate_parts_id, presence: true
  validates :employee_ids, presence: true

  has_and_belongs_to_many :employees
end
