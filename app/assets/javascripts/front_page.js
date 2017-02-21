// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function selectOrder(order, that) {
  console.log(order + " was selected");
  $('input.' + order).attr('checked', 'checked');
}
