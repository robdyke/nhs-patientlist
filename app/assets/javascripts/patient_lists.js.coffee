jQuery ($) ->
  $('#new_own_patient_list').bind
    'ajax:before': (event) ->
      $('input[type="submit"]', event.target).attr 'disabled', 'true'
      #disable submit button
    'ajax:success': (event, data) ->
      $('.error', event.target).removeClass 'error'
      $('div.messages', event.target).html ''
      $("<li><a href=\"/users/#{data['user_id']}/patient_lists/#{data['id']}\">#{data['name']}</a></li>").appendTo '#patient-list-index'
    'ajax:error': (event, data) ->
      $('div.messages', event.target).text JSON.parse(data['responseText'])['name']
      $('#new-list-name', event.target).addClass 'error'
    'ajax:complete': (event) ->
      $('input[type="submit"]', event.target).removeAttr 'disabled'