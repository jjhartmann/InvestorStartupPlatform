class HelloWorldController < ApplicationController
  def index
    @hello_world_props = { name: "Stranger" }
  end

  def test
    puts params
    redirect_to root_path
  end
end
