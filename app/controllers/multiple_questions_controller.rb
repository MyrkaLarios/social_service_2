# frozen_string_literal: true

class MultipleQuestionsController < ApplicationController
  def new
    @unit = determine_unit
    @question = MultipleQuestion.new
    3.times { @question.multiple_question_options.new }
    @comprehension_question = params[:comprehension_question]
    @questions = MultipleQuestion.all_non_comprehension
  end

  def edit
    question
  end

  def show
    question
  end

  def index
    @question = MultipleQuestion.new
    @questions = MultipleQuestion.all_non_comprehension
    @editorials = Editorial.all
    @period = Period.actual_period
    @actual_editorial = @period.present? ? @period.editorial : Editorial.last
    @path = new_multiple_question_path
  end

  def create
    @question = QuestionManager.create_multiple_question(question_params, params[:correct_answ])
    if @question.persisted?
      c_q = params[:multiple_question][:comprehension_question]
      if c_q.present?
        redirect_to comprehension_question_path(c_q)
      else
        redirect_to multiple_questions_path
      end
    end
  end

  def update
    if QuestionManager.update_multiple_question(question, question_params, params[:correct_answ])
      flash[:success] = 'Se actualizó correctamente'
      redirect_to multiple_questions_path
    else
      redirect_back fallback_location: { action: 'new', alert: question.errors.full_messages.join(' ') }
    end
  end

  def destroy
    question.destroy
    flash[:success] = 'Se eliminó la pregunta con éxito'
    redirect_to multiple_questions_path
  rescue StandardError => e
    flash[:warning] = e
    redirect_back fallback_location: { action: 'new', notice: question.errors.full_messages.join(' ') }
  end

  private

  def question_params
    params.require(:multiple_question).permit(:content,
                                              :value,
                                              :unit_id,
                                              :user_id,
                                              :comprehension_question,
                                              :comprehension_question_id,
                                              multiple_question_options_attributes: %i[id content correct _destroy])
  end

  def question
    @question ||= MultipleQuestion.find(params[:id])
  end

  def determine_unit
    if params[:unit]
      params[:unit][:unit_id]
    elsif params[:multiple_question]
      params[:multiple_question][:unit]
    elsif params[:comprehension_question]
      ComprehensionQuestion.find(params[:comprehension_question]).unit.id
    end
  end
end
