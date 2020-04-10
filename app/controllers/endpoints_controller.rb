class EndpointsController < ApplicationController
  def index
    @endpoints = YAML.load_file("#{Rails.root}/db/endpoints.yml")
  end
end
