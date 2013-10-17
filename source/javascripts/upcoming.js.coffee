#= require jquery
#= require moment.min

$(document).ready ->
  upcoming = $('.upcoming')

  upcoming.each ->
    element = $(this)
    dateString = element.data('datetime')

    today = moment().startOf('day').toDate()
    presentedAt = moment(dateString).toDate()

    element.toggle(today < presentedAt)
    