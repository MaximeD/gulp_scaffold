# Include a github file.
for el in $('.github-file')
  $el = $(el)
  $.get $el.data('url'), (resp) ->
    el.innerHTML = resp
    PR.prettyPrint()
