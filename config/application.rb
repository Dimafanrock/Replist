# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'
require 'graphql/client'
require 'graphql/client/http'
Bundler.require(*Rails.groups)

module Replist
  class Application < Rails::Application
    config.load_defaults 7.0
  end
  HTTP = GraphQL::Client::HTTP.new('https://api.github.com/graphql') do
    def headers(_context)
      { "Authorization": 'Bearer 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' }
    end
  end
  Schema = GraphQL::Client.load_schema('db/schema.json')
  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)
end
