class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      @meeting = policy_scope(Meeting.where("address ILIKE ?", "%#{params[:query]}%")).sample(10)
    else
      @meetings = policy_scope(Meeting).sample(10)
    end
  end
end
