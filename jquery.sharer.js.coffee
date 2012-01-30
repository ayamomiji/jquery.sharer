jQuery ($) ->
  sharers =
    facebook: (url, description) ->
      "http://www.facebook.com/sharer.php?u=" + encodeURIComponent(url)
    twitter: (url, description) ->
      "http://twitter.com/?status=" +
        encodeURIComponent(description + ' - ' + url)
    plurk: (url, description) ->
      "http://www.plurk.com/?qualifier=shares&status=" +
        encodeURIComponent(url + ' (' + description + ')')

  isBlank = (str) ->
    not (_.isString(str) && $.trim(str) != '')

  $('[data-share]').click (e) ->
    e.preventDefault()
    self = $(e.target)

    platform = self.data('share')
    if not _.include(_.keys(sharers), platform)
      throw '[sharer] unsupported platform: ' + platform

    url = self.data('share-href')
    if isBlank(url)
      url = self.attr('href')
    if isBlank(url)
      form = self.parents('form[action]')
      if form.length > 0
        url = form.attr('action')
        qs = form.serialize()
        if not isBlank(qs)
          url += '?' + qs
    if isBlank(url)
      throw '[sharer] blank url: ' + url

    description = self.data('share-description')
    if isBlank(description)
      description = null

    shareLocation = sharers[platform](url, description)
    window.open(shareLocation)
