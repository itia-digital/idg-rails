# frozen_string_literal: true

##
#
# == Find Service
# Generic Idg :fetch service, to find record in database.
#
# ==== How does it works?
# It gets the base data class and the id and on call finds it.
# E.g.: user = Idg::FindService.call(User, params[:id])
#
module Idg
  class FindService < Service
    attr_reader :id

    def initialize(schema, id)
      @fetch = schema
      @id = id
    end

    def call(&block)
      @fetch.find(@id)
      yield(@subject) if block_given?
      @subject
    end
  end
end