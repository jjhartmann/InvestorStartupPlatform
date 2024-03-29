$(document).on 'rails_admin.dom_ready', (e, content) ->
  ######################################################
  # Table style
  ##################################################### #
  $table = $('#bulk_form').find('table')
  table = $table[0]
# Abort if there's nothing to do. Don't repeat ourselves, either.
  if !table or $table.hasClass('js-horiz-scroll')
    return
# Add our indicator class. Also some enhancements.
  $table.addClass 'js-horiz-scroll table-hover'
#//
# Make the table horizontally scrollable.
# Inspiration from bootstrap's table-responsive.
#//
  tableWrapper = document.createElement('DIV')
#tableWrapper.className = 'table-responsive';
#tableWrapper.style.width = '100%';
  tableWrapper.style.overflowX = 'auto'
  tableWrapper.style.marginBottom = table.style.marginBottom
  table.style.marginBottom = '0'
#tableWrapper.style.overflowY = 'hidden';
  table.parentElement.insertBefore tableWrapper, table
  tableWrapper.appendChild table
  $table.find('th.last,td.last').each (index, td) ->
    tr = td.parentElement
    tr.insertBefore td, tr.children[1]
    return

  # Freeze the left columns.
  $trs = $table.find('tr')
  $headerTr = $trs.first()
  $headerTds = $headerTr.children('th,td')
  i = undefined
  $td = undefined
  pos = undefined
  offsets = []
  widths = []
  i = 0
  while i < 3
    $td = $($headerTds[i])
    pos = $td.position()
    offsets.push pos.left
    widths.push $td.outerWidth()
    i++
  $trs.each (index, tr) ->
    i = 0
    while i < 3
      tr.children[i].style.position = 'absolute'
      tr.children[i].style.left = offsets[i] + 'px'
      tr.children[i].style.width = widths[i] + 'px'
      i++
    return
  $td = $($headerTds[2])
  margin = $td.position().left + $td.outerWidth() - ($(tableWrapper).position().left)
  tableWrapper.style.marginLeft = margin + 'px'
  tableWrapper.style.borderLeft = '1px solid black'
  # Bottom-align the headers.
  trHeight = $headerTr.height()
  i = 0
  while i < 3
    $td = $($headerTr[0].children[i])
    $td.css 'padding-top', trHeight - $td.height() - 4 + 'px'
    i++
  # Remove main browser window's horizontal scrollbar.
  $('body').css 'overflow-x', 'hidden'


  ######################################################
  # Content Style
  ######################################################
  content = if content then content else $('form')

  if content.length # don't waste time otherwise

# colorpicker

    content.find('[data-color]').each ->
      that = this
      $(this).ColorPicker
        color: $(that).val()
        onShow: (el) ->
          $(el).fadeIn(500)
          false
        onHide: (el) ->
          $(el).fadeOut(500)
          false
        onChange: (hsb, hex, rgb) ->
          $(that).val(hex)
          $(that).css('backgroundColor', '#' + hex)

    # datetime picker
    $.fn.datetimepicker.defaults.icons =
      time: 'fa fa-clock-o'
      date: 'fa fa-calendar'
      up: 'fa fa-chevron-up'
      down: 'fa fa-chevron-down'
      previous: 'fa fa-angle-double-left'
      next: 'fa fa-angle-double-right'
      today: 'fa fa-dot-circle-o'
      clear: 'fa fa-trash'
      close: 'fa fa-times'

    content.find('[data-datetimepicker]').each ->
      options = $(this).data('options')
      $.extend(options, {locale: RailsAdmin.I18n.locale})
      $(this).datetimepicker options

    # enumeration

    content.find('[data-enumeration]').each ->
      if $(this).is('[multiple]')
        $(this).filteringMultiselect $(this).data('options')
      else
        $(this).filteringSelect $(this).data('options')

    # fileupload

    content.find('[data-fileupload]').each ->
      input = this
      $(this).on 'click', ".delete input[type='checkbox']", ->
        $(input).children('.toggle').toggle('slow')

    # fileupload-preview

    content.find('[data-fileupload]').change ->
      input = this
      image_container = $("#" + input.id).parent().children(".preview")
      unless image_container.length
        image_container = $("#" + input.id).parent().prepend($('<img />').addClass('preview').addClass('img-thumbnail')).find('img.preview')
        image_container.parent().find('img:not(.preview)').hide()
      ext = $("#" + input.id).val().split('.').pop().toLowerCase()
      if input.files and input.files[0] and $.inArray(ext, ['gif', 'png', 'jpg', 'jpeg', 'bmp']) != -1
        reader = new FileReader()
        reader.onload = (e) ->
          image_container.attr "src", e.target.result
        reader.readAsDataURL input.files[0]
        image_container.show()
      else
        image_container.hide()

    # filtering-multiselect

    content.find('[data-filteringmultiselect]').each ->
      $(this).filteringMultiselect $(this).data('options')
      if $(this).parents("#modal").length # hide link if we already are inside a dialog (endless issues on nested dialogs with JS)
        $(this).siblings('.btn').remove()
      else
        $(this).parents('.control-group').first().remoteForm()

    # filtering-select

    content.find('[data-filteringselect]').each ->
      $(this).filteringSelect $(this).data('options')
      if $(this).parents("#modal").length # hide link if we already are inside a dialog (endless issues on nested dialogs with JS)
        $(this).siblings('.btn').remove()
      else
        $(this).parents('.control-group').first().remoteForm()

    # nested-many

    content.find('[data-nestedmany]').each ->
      field = $(this).parents('.control-group').first()
      nav = field.find('> .controls > .nav')
      tab_content = field.find('> .tab-content')
      toggler = field.find('> .controls > .btn-group > .toggler')
      # add each nested field to a tab-pane and reference it in the nav
      tab_content.children('.fields:not(.tab-pane)').addClass('tab-pane').each ->
        $(this).attr('id', 'unique-id-' + (new Date().getTime()) + Math.floor(Math.random() * 100000)) # some elements are created on the same ms
        nav.append('<li><a data-toggle="tab" href="#' + this.id + '">' + $(this).children('.object-infos').data('object-label') + '</a></li>')
      # only if no tab is set to active
      if nav.find("> li.active").length == 0
# init first tab, toggler and tab_content/tabs visibility
        nav.find("> li > a[data-toggle='tab']:first").tab('show')
      if nav.children().length == 0
        nav.hide()
        tab_content.hide()
        toggler.addClass('disabled').removeClass('active').children('i').addClass('icon-chevron-right')
      else
        if toggler.hasClass('active')
          nav.show()
          tab_content.show()
          toggler.children('i').addClass('icon-chevron-down')
        else
          nav.hide()
          tab_content.hide()
          toggler.children('i').addClass('icon-chevron-right')

    # nested-one

    content.find('[data-nestedone]').each ->
      field = $(this).parents('.control-group').first()
      nav = field.find("> .controls > .nav")
      tab_content = field.find("> .tab-content")
      toggler = field.find('> .controls > .btn-group > .toggler')
      tab_content.children(".fields:not(.tab-pane)").addClass('tab-pane active').each ->
# Convert the "add nested field" button to just showing the title of the new model
        field.find('> .controls .add_nested_fields').removeClass('add_nested_fields').html($(this).children('.object-infos').data('object-label'))
        nav.append('<li><a data-toggle="tab" href="#' + this.id + '">' + $(this).children('.object-infos').data('object-label') + '</a></li>')
      first_tab = nav.find("> li > a[data-toggle='tab']:first")
      first_tab.tab('show')
      field.find("> .controls > [data-target]:first").html('<i class="icon-white"></i> ' + first_tab.html())
      nav.hide()
      if nav.children().length == 0
        nav.hide()
        tab_content.hide()
        toggler.addClass('disabled').removeClass('active').children('i').addClass('icon-chevron-right')
      else
        if toggler.hasClass('active')
          toggler.children('i').addClass('icon-chevron-down')
          tab_content.show()
        else
          toggler.children('i').addClass('icon-chevron-right')
          tab_content.hide()

    # polymorphic-association

    content.find('[data-polymorphic]').each ->
      type_select = $(this)
      field = type_select.parents('.control-group').first()
      object_select = field.find('select').last()
      urls = type_select.data('urls')
      type_select.on 'change', (e) ->
        if $(this).val() is ''
          object_select.html('<option value=""></option>')
        else
          $.ajax
            url: urls[type_select.val()]
            data:
              compact: true
              all: true
            beforeSend: (xhr) ->
              xhr.setRequestHeader("Accept", "application/json")
            success: (data, status, xhr) ->
              html = $('<option></option>')
              $(data).each (i, el) ->
                option = $('<option></option>')
                option.attr('value', el.id)
                option.text(el.label)
                html = html.add(option)
              object_select.html(html)

    # ckeditor

    goCkeditors = ->
      content.find('[data-richtext=ckeditor]').not('.ckeditored').each (index, domEle) ->
        try
          if instance = window.CKEDITOR.instances[this.id]
            instance.destroy(true)
        window.CKEDITOR.replace(this, $(this).data('options'))
        $(this).addClass('ckeditored')

    $editors = content.find('[data-richtext=ckeditor]').not('.ckeditored')
    if $editors.length
      if not window.CKEDITOR
        options = $editors.first().data('options')
        window.CKEDITOR_BASEPATH = options['base_location']
        $.getScript options['jspath'], (script, textStatus, jqXHR) =>
          goCkeditors()
      else
        goCkeditors()

    #codemirror

    goCodeMirrors = (array) =>
      array.each (index, domEle) ->
        options = $(this).data('options')
        textarea = this
        $.getScript options['locations']['mode'], (script, textStatus, jqXHR) ->
          $('head').append('<link href="' + options['locations']['theme'] + '" rel="stylesheet" media="all" type="text\/css">')
          CodeMirror.fromTextArea(textarea, options['options'])
          $(textarea).addClass('codemirrored')

    array = content.find('[data-richtext=codemirror]').not('.codemirrored')
    if array.length
      @array = array
      if not window.CodeMirror
        options = $(array[0]).data('options')
        $('head').append('<link href="' + options['csspath'] + '" rel="stylesheet" media="all" type="text\/css">')
        $.getScript options['jspath'], (script, textStatus, jqXHR) =>
          goCodeMirrors(@array)
      else
        goCodeMirrors(@array)

    # bootstrap_wysihtml5

    goBootstrapWysihtml5s = (array, config_options) =>
      array.each ->
        $(@).addClass('bootstrap-wysihtml5ed')
        $(@).closest('.controls').addClass('well')
        $(@).wysihtml5(config_options)

    array = content.find('[data-richtext=bootstrap-wysihtml5]').not('.bootstrap-wysihtml5ed')
    if array.length
      @array = array
      options = $(array[0]).data('options')
      config_options = $.parseJSON(options['config_options'])
      if not window.wysihtml5
        $('head').append('<link href="' + options['csspath'] + '" rel="stylesheet" media="all" type="text\/css">')
        $.getScript options['jspath'], (script, textStatus, jqXHR) =>
          goBootstrapWysihtml5s(@array, config_options)
      else
        goBootstrapWysihtml5s(@array, config_options)

    # froala_wysiwyg

    goFroalaWysiwygs = (array) =>
      array.each ->
        options = $(@).data('options')
        config_options = $.parseJSON(options['config_options'])
        if config_options
          config_options['imageUploadParams'].authenticity_token = $('meta[name=csrf-token]').attr('content');
          config_options['imageManagerLoadParams'].authenticity_token = $('meta[name=csrf-token]').attr('content');
          if !config_options['toolbarInline']
            config_options['toolbarInline'] = false
        else
          config_options = {toolbarInline: false}

        if config_options['imageUploadURL']
          uploadEnabled = true;

        $(@).addClass('froala-wysiwyged')
        $(@).froalaEditor(config_options)
        if uploadEnabled
          $(@).on 'froalaEditor.imageError', (e, editor, error) ->
            alert("error uploading image: " + error.message);
            # Custom error message returned from the server.
            if error.code == 0

# Bad link.
            else if error.code == 1

# No link in upload response.
            else if error.code == 2

# Error during image upload.
            else if error.code == 3

# Parsing response failed.
            else if error.code == 4

# Image too large.
            else if error.code == 5

# Invalid image type.
            else if error.code == 6

# Image can be uploaded only to same domain in IE 8 and IE 9.
            else if error.code == 7

            else

            return

          .on('froalaEditor.image.removed', (e, editor, $img) ->
# Set the image source to the image delete params.
            editor.options.imageDeleteParams =
              src: $img.attr('src')
              authenticity_token: $('meta[name=csrf-token]').attr('content')
            # Make the delete request.
            editor.deleteImage $img
            return
          ).on('froalaEditor.imageDeleteSuccess', (e, editor, data) ->
# handle success
          ).on 'froalaEditor.imageDeleteError', (e, editor, error) ->
# handle error
            alert("error deleting image: " + error.message);

    array = content.find('[data-richtext=froala-wysiwyg]').not('.froala-wysiwyged')
    if array.length
      options = $(array[0]).data('options')
      if not $.isFunction($.fn.froalaEditor)
        $('head').append('<link href="' + options['csspath'] + '" rel="stylesheet" media="all" type="text\/css">')
        $.getScript options['jspath'], (script, textStatus, jqXHR) =>
          goFroalaWysiwygs(array)
      else
        goFroalaWysiwygs(array)