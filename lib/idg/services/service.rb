# frozen_string_literal: true

##
#
# == Fetch Service
# Generic Idg service, to wrap all Idg source.
#
# ==== How does it works?
# This service includes a class method :call that creates a new
# instance of the class with the arguments or block you pass to it,
# and calls call on the instance
#
# E.g.: MyService.call(params[:message])
#
module Idg
  class Service
    def self.call(*args, &block)
      new(*args, &block).call
    end
  end
end
