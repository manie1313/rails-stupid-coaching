class QuestionsController < ApplicationController
  def ask
    # session.delete(:history)
  end


# reset_session ==> clear session temporarely

  def answer

    question = params[:question]
    # session.delete(:history)
    # session[:history] = []
    if params[:question].present?
      session[:history] << {
        "question" => question,
        "answer" => coach_answer(question)
      }
      # raise
    end

    # session[:history][0]["question"] ==> 1st question
    # session[:history][0]["answer"] ==> 1st answer
    @hey = "YYYYYYYY"
    raise
    @questions = session[:history].map { |convo| convo["question"] }
    @answers = session[:history].map { |convo| convo["answer"] }
  end

  def coach_answer(question)
    case question.downcase
    when 'i am going to work' then 'Great!'
    when /\?$/ then "Silly question, get dressed and go to work!."
    else "I don't care, get dressed and go to work!"
    end
  end
  #   if question == "I am going to work"
  #     return answer = "Great!"
  #   elsif question.end_with?("?")
  #     return answer = "Silly question, get dressed and go to work!."
  #   else
  #     return answer = "I don't care, get dressed and go to work!"
  #   end
  # end
end
