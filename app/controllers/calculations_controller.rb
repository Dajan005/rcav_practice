class CalculationsController < ApplicationController
  def instructions
    render("instructions.html.erb")
  end

  def square_root
    @num = params[:num].to_i
    @sqrt = Math.sqrt(@num)
  end

  def random_number
    @min = params[:min].to_i
    @max = params[:max].to_i

  end

  def payment
    @rate = params[:rate].to_f/100
    @term = params[:years].to_i
    @principal = params[:principal].to_i
    @i = (1+(@rate/100)/12)**(12/12)-1
    @month = @term *12
    @af = (1-(1/(1+@i))**@month)/@i

    @payment = (@principal/@af).round
  end

end
