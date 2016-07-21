<%= link_to book.name, book %>
<% if current_user.admin? && !current_user?(user) %>
    | <%= link_to "delete", book, method: :delete,
        data: { confirm: "You sure?"  } %>
<% end %>
