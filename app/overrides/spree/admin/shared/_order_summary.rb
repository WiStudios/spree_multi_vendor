# Deface::Override.new(
#     virtual_path: 'spree/admin/shared/_order_summary',
#     name: 'display_vendor_subtotal',
#     replace: "erb[loud]:contains('@order.display_item_total.to_html')",
#     text: "<%= current_spree_vendor ? @order.display_vendor_subtotal(current_spree_vendor).to_html : @order.display_item_total.to_html %>"
# )

# Deface::Override.new(
#     virtual_path: 'spree/admin/shared/_order_summary',
#     name: 'display_vendor_ship_total',
#     replace: "erb[loud]:contains('@order.display_ship_total.to_html')",
#     text: "<%= current_spree_vendor ? @order.display_vendor_ship_total(current_spree_vendor).to_html : @order.display_ship_total.to_html %>"
# )

# Deface::Override.new(
#     virtual_path: 'spree/admin/shared/_order_summary',
#     name: 'display_vendor_total',
#     replace: "erb[loud]:contains('@order.display_total.to_html')",
#     text: "<%= current_spree_vendor ? @order.display_vendor_total(current_spree_vendor).to_html : @order.display_total.to_html %>"
# )
Deface::Override.new(
    virtual_path: 'spree/admin/shared/_order_summary',
    name: 'display_commission',
    insert_after: 'td[id="item_total"]',
    text: <<-HTML
            <tr>
              <td data-hook='admin_order_tab_commission'>
                <strong><%= Spree.t('admin.commission') %>:</strong>
              </td>
              <td id='order_commission'>
                <% if @order.commissions.present? %>
                  <% @order.commissions.each do |vendor_commission| %>
                    <%= vendor_commission.vendor.name %> - <%= Spree::Money.new(vendor_commission.amount, {currency: @order.currency}) %> <br/>
                  <% end %>
                  <%= @order.commissions.count > 1 ? "Total - " + @order.display_order_commission.to_s : "" %>
                <% else %>
                  <%= @order.display_order_commission %>
                <% end %>
              </td>
          </tr>
    HTML
)
