# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  @add_row = ->
    $('#question-set-table tbody > tr:last').after """
      <tr>
        <td><input type='text' name='texts[]'' id='texts_' size='80x3'></td>
        <td><button name='button' type='button' confirm='Are you sure?' id='destroy-question-button' class='btn btn-default delete'>Destroy</button></td>
      </tr>
    """

  # edit.html.slimでこれを指定したいがthisがおかしくなる？
  @delete_row =  ->
    $(this).closest('tr').remove()
