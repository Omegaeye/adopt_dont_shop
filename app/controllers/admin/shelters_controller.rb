class Admin::SheltersController < ApplicationController

  def index
    @shelters = Shelter.find_by_sql(
                        "SELECT
                        *
                        FROM shelters
                        order by
                        name DESC"
                        )
  end

  def show
    @shelter = Shelter.find_by_sql("
                      SELECT
                      *
                      FROM shelters
                      WHERE
                      id = #{params[:id]}").first
    # @shelter = Shelter.find(params[:id])
  end

end
