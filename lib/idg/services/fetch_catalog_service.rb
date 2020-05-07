# frozen_string_literal: true

##
#
# == Find Service
# Generic Idg :fetch service, it wraps default models with [:code :title] attributes
#
# ==== How does it works?
# Extends FetchService to remove same code for records with :code and :title attrs
#
# ==== Implementation
#
# ```ruby
# ...code
#       def initialize(params)
#         super(User, params)
#       end
#
#       def call(&block)
#         @fetch = @fetch.where(..)
#         super(&block)
#       end
# ```
#
module Idg
  class FetchCatalogService < FetchService

    def initialize(schema, params)
      super schema, params
      @search_columns = %w(code title)
    end


    def call(&block)
      super do
        unless order_by_is_present?
          @fetch = @fetch.order(:code) if @apply_order
        end

        yield(@fetch) if block_given?
      end
    end

  end
end