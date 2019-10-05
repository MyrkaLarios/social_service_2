# frozen_string_literal: true

# == Schema Information
#
# Table name: comprehension_questions
#
#  id         :bigint           not null, primary key
#  content    :string(255)
#  value      :integer
#  lecture    :text(4294967295)
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit_id    :bigint
#

require "test_helper"

describe ComprehensionQuestion do

end
