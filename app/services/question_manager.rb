# frozen_string_literal: true

class QuestionManager
  def self.create_multiple_question(question_params, correct_answ)
    question = MultipleQuestion.create(question_params)
    assign_correct_answ(question, question_params, correct_answ)
    question
  end

  def self.create_comprehension_question(question_params)
    ComprehensionQuestion.create(question_params)
  end

  def self.assign_correct_answ(question, question_params, correct_answ)
    set_all_options_to_false(question)
    correct_answ_content = if question_params[:multiple_question_options_attributes]
                             question_params[:multiple_question_options_attributes][correct_answ][:content]
                           else
                             question_params[:comprehension_options_attributes][correct_answ][:content]
                           end
    correct_answ = question.options.detect { |q| q.content == correct_answ_content }
    correct_answ.update(correct: true)
  end

  def self.set_all_options_to_false(question)
    question.options.each do |option|
      option.update(correct: false)
    end
  end

  def self.update_multiple_question(question, question_params, correct_answ)
    question.update(question_params)
    assign_correct_answ(question, question_params, correct_answ)
    question
  end

  def self.update_comprehension_question(question, question_params)
    question.update(question_params)
  end
end
