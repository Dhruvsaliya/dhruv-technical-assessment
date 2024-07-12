class CalculatorsController < ApplicationController
  def create
    @numbers = params[:numbers]
    Rails.logger.debug "Submitted numbers: #{@numbers}"
    @result = StringCalculator.add(@numbers)
    Rails.logger.debug "Calculated result: #{@result}"
  end
end