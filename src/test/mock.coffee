define (require) ->
  $ = require('jquery')
  require('mockjax')

  $.mockjaxSettings.responseTime = 500 # Set the mock latency for all requests

  # GET

  $.mockjax (settings) ->
    # settings.url === '/contents/<uuid>'
    service = settings.url.match(/\/contents\/(.*)$/)

    if service
      return {proxy: 'data/' + service[1] + '.json'}

  $.mockjax (settings) ->
    # settings.url === '/search?q=physics'
    service = settings.url.match(/\/search\?q=physics$/)

    if service
      return {proxy: 'data/search.json'}

  $.mockjax (settings) ->
    # settings.url === 'exports-allowable-types/<uuid>'
    service = settings.url.match(/\/extra\/(.*)$/)

    if service
      return {proxy: 'data/extra.json'}
