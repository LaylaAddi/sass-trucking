git add -A
git commit -m "       <% if !truck.driver_user.first_name.nil? %>
          <%= truck.driver_user.first_name %>
          <% end %>
          <% if !truck.driver_user.last_name.nil? %>"
git push -u origin master 
git push dokku master    



