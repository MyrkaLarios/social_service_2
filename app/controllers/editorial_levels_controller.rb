# frozen_string_literal: true

class EditorialLevelsController < ApplicationController
  def show
    if params[:editorial_id].present?
      @levels = Level.available_levels_by_editorial(params[:editorial_id])
      @questions = Editorial.find(params[:editorial_id]).multiple_questions
      @units = @levels.first&.units ? @levels.first.units : []
    else
      @questions = MultipleQuestion.all_non_comprehension
    end
    respond_to do |format|
      format.js
    end
  end
end
