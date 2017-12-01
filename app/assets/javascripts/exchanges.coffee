# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  update = ->
    callTickerApi()
    return

  callTickerApi = ->
    $.ajax
      url: '/v1/ticker'
      type: 'GET'
      data:
        id: gon.exchange_id
      dataType: 'json'
      timeout: 1000
      success: (data, dataType) ->
        setText('.volume', data['volume'])
        setText('.bid', data['bid'])
        setText('.ask', data['ask'])
        setText('.spread', data['spread'])
        console.log 'ok'
        return
      error: (XMLHttpRequest, textStatus, errorThrown) ->
        console.log 'ng'
        return

  setText = (selector, text) ->
    $(selector).text(text)

  $ ->
#    setInterval update, 3000
#    callTickerApi()
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
  return