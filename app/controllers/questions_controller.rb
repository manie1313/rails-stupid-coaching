class QuestionsController < ApplicationController
  def ask
  end

  def answer
    # raise

    if question = params[:question] !=nil
      session[:history] << {
        question: "question",
        answer: coach_answer(question)
      }
    end
    # session[:history][0]["question"] ==> 1st question
    # session[:history][i]["answer"] ==> 1st answer
    @questions = session[:history].map { |convo| convo["question"] }
    @answers = session[:history].map { |convo| convo["answer"] }


  end

  private

  def coach_answer(question)
    case question
    when 'I am going to work' then 'Great!'
    when /\?$/ then "Silly question, get dressed and go to work!."
    else "I don't care, get dressed and go to work!"
    end
    # if question == "I am going to work"
    #   return answer = "Great!"
    # elsif question.end_with?("?")
    #   return answer = "Silly question, get dressed and go to work!."
    # else
    #   return answer = "I don't care, get dressed and go to work!"
    # end
  end
end
