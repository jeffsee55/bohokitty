#= require active_admin/base
#= require froala_editor.min.js

$ ->
  $('#product_description').editable(
    {
    height: 300
    inlineMode: false
    }
  )
  $('#post_body').editable(
    {
    height: 300
    inlineMode: false
    }
  )
