module NetSuite
  module Records
    class Estimate
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::TranSales

      actions :get, :get_list, :add, :initialize, :delete, :update, :upsert, :search

      fields :created_date, :last_modified_date, :tran_date, :tran_id,
             :title, :probability, :include_in_forecast, :due_date, :status,
             :expected_close_date, :total_cost_estimate, :est_gross_profit,
             :est_gross_profit_percent, :to_be_printed, :to_be_email, :email,
             :to_be_faxed, :visible_to_customer, :message, :addr_text
                                                                     
      field :shipping_address, ShipAddress
      field :billing_address, BillAddress
      #field :item_list, OpportunityItemList
      field :custom_field_list, CustomFieldList

      read_only_fields :handling_cost, :discount_total, :sub_total, :tax_total, :total

      record_refs :account, :buying_reason, :currency, :klass, :department, :entity, :entity_status, :location,
        :partner, :subsidiary, :sales_group, :sales_rep, :custom_form, :job, :forcast_type,
        :lead_source, :sales_readiness, :win_loss_reason, :opportunity, :bill_address_list, :ship_address_list

      attr_reader :internal_id
      attr_accessor :external_id
      attr_accessor :search_joins

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end

      def self.search_class_name
        "Transaction"
      end

      def self.search_class_namespace
        'tranSales'
      end
    end
  end
end
