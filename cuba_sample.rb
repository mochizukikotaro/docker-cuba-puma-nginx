require "cuba"
require "cuba/safe"
require "cuba/render"

Cuba.use Rack::Session::Cookie, :secret => "__a_very_long_string__"
Cuba.plugin Cuba::Safe
Cuba.plugin Cuba::Render
Cuba.settings[:render][:template_engine] = "erb"

class Cuba
  module Render
    def _cache
      Tilt::Cache.new
    end
  end
end

Cuba.define do

  on get do
    on "users/:name" do |name|
      res.write view("users", name: name)
    end
  end


  on post do
    on "posts" do
      on param("payload") do |payload|
        res.write view("posts", data: payload)
      end
    end
  end
end
