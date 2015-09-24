class StaticPagesController < ApplicationController
  def index
    @league = League.first
  end
end
