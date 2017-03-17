/* global $ */
$(document).ready(function () {
  console.log('loaded')
  function sortAscPrice (e) {
    e.preventDefault()
    var $propDivs = $('.sortProps')
    var $sortedAscPropDivs = $propDivs.sort(function (a, b) {
      return parseInt($(a).find('.propPrice').text()) - parseInt($(b).find('.propPrice').text())
    })
    $('.propPanel').html($sortedAscPropDivs)
  }

  $('.lowPrice').on('click', sortAscPrice)

  function sortDescPrice (e) {
    e.preventDefault()
    var $propDivs = $('.sortProps')
    var $sortedDescPropDivs = $propDivs.sort(function (a, b) {
      return parseInt($(b).find('.propPrice').text()) - parseInt($(a).find('.propPrice').text())
    })
    $('.propPanel').html($sortedDescPropDivs)
  }

  $('.highPrice').on('click', sortDescPrice)

  function sortPopular (e) {
    e.preventDefault()
    var $propDivs = $('.sortProps')
    var $sortedDescPopDivs = $propDivs.sort(function (a, b) {
      return parseInt($(b).find('.propPop').text()) - parseInt($(a).find('.propPop').text())
    })
    $('.propPanel').html($sortedDescPopDivs)
  }

  $('.popularity').on('click', sortPopular)

  function sortRecency (e) {
    e.preventDefault()
    var $propDivs = $('.sortProps')
    var $sortedRecentPopDivs = $propDivs.sort(function (a, b) {
      return parseInt($(b).find('.propTime').text()) - parseInt($(a).find('.propTime').text())
    })
    $('.propPanel').html($sortedRecentPopDivs)
  }

  $('.recency').on('click', sortRecency)
})
