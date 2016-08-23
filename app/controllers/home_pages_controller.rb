class HomePagesController < ApplicationController
  layout 'frontpage'
  # GET /home_pages
  # GET /home_pages.json
  def index
    @hello_world_props = { name: "Stranger" }
  end

  # GET /home_pages/1
  # GET /home_pages/1.json
  def show
  end

  # GET /home_pages/new
  def new

  end

  # GET /home_pages/1/edit
  def edit
  end

  # POST /home_pages
  # POST /home_pages.json
  def create

  end

  # PATCH/PUT /home_pages/1
  # PATCH/PUT /home_pages/1.json
  def update
    
  end

  # DELETE /home_pages/1
  # DELETE /home_pages/1.json
  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.

end
