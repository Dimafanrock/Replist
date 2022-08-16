require_relative "boot"
require "rails/all"
require "graphql/client"
require "graphql/client/http"
Bundler.require(*Rails.groups)

module Replist
  class Application < Rails::Application    
    config.load_defaults 7.0    
  end
    HTTP = GraphQL::Client::HTTP.new("https://api.github.com/graphql") do
      def headers(context)      
        { "Authorization": "Bearer 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" }
      end
    end  
    Schema = GraphQL::Client.load_schema("db/schema.json")  
    Client = GraphQL::Client.new(schema: Schema, execute: HTTP)  
end

