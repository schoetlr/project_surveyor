class StaticPagesController < ApplicationController
  def home
    @surveys = Survey.order(created_at: "DESC")
  end
end
