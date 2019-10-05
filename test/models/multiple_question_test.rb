# frozen_string_literal: true

# == Schema Information
#
# Table name: multiple_questions
#
#  id                        :bigint           not null, primary key
#  content                   :string(255)
#  value                     :integer
#  user_id                   :bigint
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  unit_id                   :bigint
#  comprehension_question_id :bigint
#

require "test_helper"

describe MultipleQuestion do

end
