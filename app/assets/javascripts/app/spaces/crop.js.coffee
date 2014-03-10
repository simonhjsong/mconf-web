$ ->
  prepareCrop = () ->
    # Clear upload everytime
    $('input.upload-preview').val('')

    $('a#crop-current').click (e) ->
      if not $(this).hasClass('disabled')
        $(this).addClass('disabled')
        mconf.Crop.bindCrop()

  if isOnPage 'spaces', 'edit'
    # Open the logo modal when clicked
    $('a#open-crop').click (e) ->
      data = {}
      url = $(this).attr('href')

      # /spaces/:id/crop
      $.get url, data, (results) ->

        mconf.Modal.showWindow
          data: results
          element: $(this)

        prepareCrop()
        mconf.Crop.enableUploadPreview()

      # To prevent the real <a> action
      return false

  # Standalone crop page
  if isOnPage 'spaces', 'crop'
    prepareCrop()
    mconf.Crop.enableUploadPreview()