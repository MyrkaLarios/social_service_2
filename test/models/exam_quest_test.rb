# frozen_string_literal: true

# == Schema Information
#
# Table name: exam_quests
#
#  id                        :bigint           not null, primary key
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  status                    :integer
#  chosed_answ               :integer
#  multiple_question_id      :bigint
#  exam_id                   :bigint
#  comprehension_question_id :bigint
#

require "test_helper"

describe ExamQuest do

end
