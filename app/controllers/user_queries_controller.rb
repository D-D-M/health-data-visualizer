class UserQueriesController < ApplicationController
  def index
    @filterrific = initialize_filterrific(
      User,
      params[:filterrific],
      select_options: {
        with_country_id: Country.options_for_select,
        gender: User.options_for_gender
      }
    ) or return

    @users = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
  end

  def show
  end

  def create
  end
end
