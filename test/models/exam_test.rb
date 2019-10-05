# frozen_string_literal: true

# == Schema Information
#
# Table name: exams
#
#  id         :bigint           not null, primary key
#  result     :integer
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  level_id   :bigint
#  period_id  :bigint
#  student_id :bigint
#  user_id    :bigint
#

require "test_helper"

describe Exam do
end
