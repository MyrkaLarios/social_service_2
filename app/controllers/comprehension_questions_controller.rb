# frozen_string_literal: true

class ComprehensionQuestionsController < ApplicationController
  def new
    @unit = determine_unit
    @question = current_user.comprehension_questions.build
    question = @question.multiple_questions.new
    3.times { question.multiple_question_options.new }
  end

  def show
    question
  end

  def index
    @question = ComprehensionQuestion.new
    @questions = ComprehensionQuestion.all
    @editorials = Editorial.all
    @actual_editorial = Period.actual_period.editorial || Editorial.last
    @path = new_comprehension_question_path
  end

  def create
    question = QuestionManager.create_comprehension_question(current_user, lecture_params)
    if question.persisted?
      redirect_to comprehension_question_path(question), notice: "Se guardó correctamente"
    end
  end

  def edit
    @unit = question.unit.number
    question
  end

  def update
    if QuestionManager.update_comprehension_question(question, question_params)
      redirect_to comprehension_question_path(question), notice: "Se actualizó correctamente"
    else
      redirect_back fallback_location: { action: "new", alert: question.errors.full_messages.join(" ") }
    end
  end

  def destroy
    question.destroy
    flash[:success] = "Se eliminó la pregunta con éxito"
    redirect_to comprehension_questions_path
  rescue StandardError => e
    flash[:warning] = e
    redirect_back fallback_location: { action: "new", notice: question.errors.full_messages.join(" ") }
  end

  private
    def lecture_params
      params.require(:comprehension_question).permit(:content, :value, :file, :unit_id, :lecture, comprehension_options_attributes: [:id, :content, :correct, :_destroy])
    end

    def question_params
      params.require(:comprehension_question).permit(:content, :value, :file, :unit_id, :lecture, comprehension_options_attributes: [:id, :content, :correct, :_destroy])
    end

    def question
      @question ||= current_user.comprehension_questions.find(params[:id])
    end

    def determine_unit
      if params[:unit]
        params[:unit][:unit_id]
      elsif params[:comprehension_question]
        params[:comprehension_question][:unit_id]
      end
    end
end
