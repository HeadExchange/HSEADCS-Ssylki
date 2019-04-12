$(function() {

  $('.share_url__button_copy').click(function() {

    console.log('clipboard js')

    const copyToClipboard = str => {
      const el = document.createElement('textarea')
      const elWithValue = $('.opened.share-url a')
      el.value = elWithValue.html()
      el.setAttribute('readonly', '')
      el.style.position = 'absolute'
      el.style.left = '-9999px'
      document.body.appendChild(el)
      const selected =
        document.getSelection().rangeCount > 0
          ? document.getSelection().getRangeAt(0)
          : false
      el.select()
      document.execCommand('copy')
      document.body.removeChild(el)
      if (selected) {
        document.getSelection().removeAllRanges()
        document.getSelection().addRange(selected)
      }
    }

  })

})
