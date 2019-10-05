# frozen_string_literal: true

class ExamsController < ApplicationController
  def index
    @exam = Exam.new
    @exams = Exam.all
    @student = Student.new
    @actual_period = Period.actual_period
  end

  def new
    @student_id = params[:student_id]
    @exam = Student.find(@student_id).exams.build
    @period = Period.actual_period
    @actual_editorial = @period.present? ? @period.editorial : Editorial.last
    @actual_period = Period.actual_period
  end

  def create
    @exam = Exam.create(exam_params)
    if @exam.persisted?
      add_questions
      flash[:success] = 'Examen creado con éxito'
      redirect_to exams_path
    else
      flash[:error] = 'Ocurrió un error'
    end
  end

  def show
    @exam = Exam.find(params[:id])
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy
    flash[:success] = 'Se eliminó correctamente el examen'
    redirect_to exams_path
  end

  private

  def exam_params
    params.require(:exam)
          .permit(:level_id, :student_id)
          .merge(date: Time.zone.now,
                 user_id: current_user.id,
                 result: 0,
                 period_id: Period.actual_period.id)
  end

  def add_questions
    @exam.level.units.each do |u|
      @mr = []
      @cr = []
      mq = params[:"multiple_questions_#{u.id}"]
      cq = params[:"comprehension_questions_#{u.id}"]
      mq[:qty].to_i.times do |_n|
        mq_random_element = generate_multiple_random(u)
        q = u.multiple_questions.offset(mq_random_element).first
        ExamQuest.create(exam: @exam, multiple_question: q)
      end
      cq[:qty].to_i.times do |_n|
        cq_random_element = generate_comprehension_random(u)
        q = u.comprehension_questions.offset(cq_random_element).first
        ExamQuest.create(exam: @exam, comprehension_question: q)
      end
    end
  end

  def generate_multiple_random(u)
    begin
      r = rand(u.multiple_questions.count)
    end while(@mr.include?(r))
    @mr << r
    r
  end

  def generate_comprehension_random(u)
    begin
      r = rand(u.comprehension_questions.count)
    end while(@cr.include?(r))
    @cr << r
    r
  end
end
