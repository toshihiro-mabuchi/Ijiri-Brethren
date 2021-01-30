$(document).on 'turbolinks:load', ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote
      lang: 'ja-JP'
      height: 300
      toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'italic', 'underline']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['insert', ['link', 'picture', 'video']],
                ['view', ['fullscreen', 'codeview']]
              ]
  $('[data-image="summernote"]').each ->
    $(this).summernote
      lang: 'ja-JP'
      height: 300
      toolbar: [
                ['insert', ['picture']]
              ]
              