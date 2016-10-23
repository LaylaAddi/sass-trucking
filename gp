git add -A
git commit -m "merger loadpl"
git push -u origin master 


 <%= link_to 'Edit', edit_load_path(@load) %>
 
 <div class="row">
  <div class="col-sm-6">
    <div class="btn-group activity-actions">
      <button type="button" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown">
      <i class="fa fa-th"></i>
      <span class="sr-only">Toggle Dropdown</span>
      </button>
      <ul class="dropdown-menu dropdown-menu-right" role="menu">
        <li></li>
        <li></li>
      </ul>
    </div>
  </div>
</div>