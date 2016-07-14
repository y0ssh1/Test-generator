# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # application.jsでbootstrap-dropdownをjqueryの前にrequireしないと動かないが、
  # そうするとエラーが出るのでdocument readyでこれを呼び出さないと行けない。
  $('.dropdown-toggle').dropdown()

  add_row = ->
    $('#question-set-table tbody').append """
      <tr>
        <td><textarea name="texts[]" id="texts_" style="resize: none" class="form-control question_text_field" cols="130" rows="3"></textarea></td>
        <td><button name="button" type="button" confirm="Are you sure?" id="delete-question-button" class="btn btn-default delete">Destroy</button></td>
      </tr>
    """

  delete_row = (source) ->
    source.closest('tr').remove()

  focus_next_text_field = (source) ->
    source.closest('tr').next().find('textarea').focus()

  $(document).on 'keypress', '.question_text_field', (e) ->
    if e.which == 13 && !e.shiftKey
      if $(@).closest('tr').is $('table#question-set-table > tbody > tr:last')
        add_row()
        focus_next_text_field($(@))
        return false
    return true

  $(document).on 'click', '#add-question-button', ->
    add_row()

  $(document).on 'click', '#delete-question-button', ->
    delete_row($(@))
