class CalculatorsController < ApplicationController
  def new
  end

  def create
    numbers = params[:numbers]
    Rails.logger.debug "Submitted numbers: #{numbers}" # Debug output
    @result = StringCalculator.add(numbers)
    Rails.logger.debug "Calculated result: #{@result}" # Debug output
    render :new
  end
end