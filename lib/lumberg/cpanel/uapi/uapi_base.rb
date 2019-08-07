module Lumberg
  module Cpanel
    module Uapi
      class UapiBase < Whm::Base
        attr_accessor :api_username

        # Public: Gets cPanel API module name based on class name. This method
        # should be overriden in subclasses where the cPanel API module name
        # and the class name don't match up.
        #
        # Returns String cPanel API module name.
        def self.api_module
          self.name.split("::").last
        end

        # Public: Initialize a new cPanel UAPI API interface.
        #
        # options - Hash options (default: {}):
        #   :api_username - String username to set as the default account
        #                   username for cPanel API calls (optional).
        def initialize(options = {})
          @api_username = options.delete(:api_username)

          super options
        end

        # Public: Perform a cPanel UAPI API method call.
        #
        # options - Hash options for API call params (default: {}):
        #   :api_function - String API function name to call.
        #   :api_module   - String API module on which API function will be
        #                   called (optional, default: self.class.api_module).
        #   :response_key - String key used to select desired part of API
        #                   response (optional, default: "data").
        #
        # Returns Hash API response.
        def perform_request(options = {})
          # options[:api_username] ||= api_username
          function = options.delete(:api_function)

          params = {
            api_module: (options.delete(:api_module) || self.class.api_module),
            response_key:  options.delete(:response_key) || "data"
          }.merge(options)

          server.perform_request(function, params)
        end
      end
    end
  end
end
