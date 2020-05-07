module Idg
  module ListableController
    extend ActiveSupport::Concern

    included do
      before_action :remove_paging, only: [:count, :filters]
    end

    private
    def remove_paging
      params.delete(:page_index)
      params.delete(:page_size)
      params.delete(:order_by)
    end

  end
end
