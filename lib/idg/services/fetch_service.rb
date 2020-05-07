# frozen_string_literal: true

##
#
# == Fetch Service
# Generic Idg :fetch service, this service fetch the database.
#
# ==== How does it works?
# This service comes with default search params handler:
# - :page_size and :page_index => Fetch specific chunk of data
# - :start_date and :end_data => Search :created_at between this dates
# - :created_at => Search by this date,
# - :order_by => Order search by Json,
# - :q => Query string,
#
module Idg
  class FetchService < Service
    attr_reader :fetch, :search_columns, :params, :apply_order

    #
    # @param schema, the base Active Record to query database
    # @param params, the query params from the request
    # @param search_columns, the columns to search by text if :q param is present
    # @param apply_order, flag to describe if apply order by default.
    #
    def initialize(schema, params:, search_columns: [], apply_order: true)
      @search_columns = search_columns
      @apply_order = apply_order
      @params = params
      @fetch = schema
    end

    def call

      # String search query
      if @params[:q]
        @fetch = @fetch.where(
          @search_columns.map { |qc| "upper(#{qc}) like :q" }.join(" or "),
          q: "%#{@params[:q].upcase}%"
        )
      end

      # Create at search query
      if @params[:created_at]
        @fetch = @fetch.where(
          "to_char(#{@fetch.table_name}.created_at, 'YYYY-MM-DD') = ?",
          @params[:created_at]
        )
      end

      # Pagination
      if @params[:page_size].present? && @params[:page_index].present?
        @fetch = @fetch
                 .limit(params[:page_size])
                 .offset(params[:page_size].to_i * @params[:page_index].to_i)
      end

      # Date ranges
      if @params[:start_date].present? || @params[:end_date].present?
        @fetch = @fetch.created_between(
          @params[:start_date].present? ? @params[:start_date].to_date : nil,
          @params[:end_date].present? ? @params[:end_date].to_date : nil
        )
      end

      # Order
      if order_by_is_present?
        @fetch = @fetch.order(JSON.parse(@params.require(:order_by)))
      end

      yield(@fetch) if block_given?
      @fetch
    end

    protected

    def order_by_is_present?
      @params[:order_by].present? &&
        @params[:order_by] != 'null' &&
        @apply_order
    end


  end
end
