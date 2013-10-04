#= require jquery
#= require moment.min

$(document).ready ->
  upcoming = $('.upcoming')

  presentedDateOf = (element) ->
    timeElement = element.siblings('.meta').find('time')
    dateString = timeElement.attr('datetime')
    moment(dateString).toDate()

  upcoming.each ->
    element = $(this)
    today = moment().startOf('day').toDate()
    presentedAt = presentedDateOf(element)

    element.toggle(today < presentedAt)
    