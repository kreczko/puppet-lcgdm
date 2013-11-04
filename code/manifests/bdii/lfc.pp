class lcgdm::bdii::lfc (
  $sitename = undef,
  $localvos      = [],
  $centralvos    = [],
  $lfcalias    = undef,
  $glue2    = true,
) {

  file {"/var/lib/bdii/gip/provider/glite-lfc-provider":
    owner => ldap,
    group => ldap,
    mode  => 755,
    content => inline_template("#! /bin/sh
/usr/libexec/lcg-info-provider-lfc <% if @glue2 %>--glue2 <% end %>--site <%= @sitename %><% if not @localvos.empty? %> --local \"<% localvos.each do |localvo| %> <%= localvo %>\"<% end %><% end %><% if not @centralvos.empty? %> --central \"<% centralvos.each do |centralvo| %> <%= centralvo %>\"<% end %><% end %><% if @lfcalias %> --alias <%= @lfcalias %><% end %>
    ")
  }
}