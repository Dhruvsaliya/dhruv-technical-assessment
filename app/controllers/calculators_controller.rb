class CalculatorsController < ApplicationController
  def create
    @numbers = params[:numbers]
    Rails.logger.debug "Submitted numbers: #{@numbers}"
    begin
      @result = StringCalculator.add(@numbers)
    rescue StringCalculator::NegativeNumberError => e
      @error = e.message
    end
    Rails.logger.debug "Calculated result: #{@result}"
    render :create, locals: { result: @result, error: @error }
  end
end