# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  callCoinHistoryApi = (time_type) ->
    $.ajax
      url: '/v1/coin_history'
      type: 'GET'
      data:
        symbol: gon.crypto_currency_symbol
        time_type: time_type
      dataType: 'json'
      success: (data, dataType) ->
        displayCart(data[0], data[1])
        console.log 'ok'
        $('.compare_spinner').hide()
        $('#myChart').show()
        return
      error: (XMLHttpRequest, textStatus, errorThrown) ->
        console.log 'ng'
        return

  $('body').on 'click', '.compare_button', ->
    time_type = $(this).attr('id')
    console.log time_type
    $('.compare_button').removeClass 'selected'
    $(this).addClass 'selected'
    $('.compare_spinner').show()
    $('#myChart').hide()
    resetCanvas()
    callCoinHistoryApi(time_type)

  setText = (selector, text) ->
    $(selector).text(text)

  $ ->
    callCoinHistoryApi('minute')
    return

  resetCanvas = ->
    $('#myChart').remove()
    # this is my <canvas> element
    $('.chart_container').append '<canvas id="myChart"><canvas>'
    canvas = document.querySelector('#myChart')
    # why use jQuery?
    ctx = canvas.getContext('2d')
    ctx.canvas.width = $('#myChart').width()
    # resize to parent width
    ctx.canvas.height = $('#myChart').height()
    return

  $ ->
    $('.list').click ->
      location.href = $(this).attr('href')
      return
    return

  $('.tab li').click ->
    index = $('.tab li').index(this)
    $('.content .main').css 'display', 'none'
    $('.content .main').eq(index).css 'display', 'block'
    $('.tab li').removeClass 'select'
    $(this).addClass 'select'
    return

  displayCart = (labels, data) ->
    context = $('#myChart')[0].getContext '2d'
    gradient = context.createLinearGradient(0, 0, 0, 400)
    gradient.addColorStop 1, 'rgba(250, 217, 97, 1)'
    gradient.addColorStop 0, 'rgba(250, 217, 97, 0)'
    chart = new Chart(context,
      type: 'line'
      data:
        labels: labels
        datasets: [{
          label: '売値'
          backgroundColor: gradient
          borderColor: '#FBDA61'
          borderWidth: 2
          data: data
        }]
      options: {
        legend:
          display: false
        elements:
          point:
            radius: 1
        scales:
          xAxes:
            [{
              gridLines:
                display: false
            }]
        tooltips:
          intersect: false
      })
    chart.clear()
    return
  return