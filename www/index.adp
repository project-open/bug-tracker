<master src="../lib/master">
<property name="title">@page_title;noquote@</property>
<property name="context">@context;noquote@</property>


<div class="filter-list">
   <div class="filter">
      <div class="filter-block">
         <listfilters name="bugs"></listfilters>
      </div>
   </div>

   <div class="fullwidth-list">
      <%= [im_box_header [_ intranet-core.Companies]] %>
      <listtemplate name="bugs"></listtemplate>
      <%= [im_box_footer] %>
   </div>
   <div class="filter-list-footer"></div>

</div>


