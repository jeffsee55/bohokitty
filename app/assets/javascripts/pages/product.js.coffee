$ ->
  i = 0
  image_1 = $('.thumbs li:first-child').css('background-image')
  image_2 = $('.thumbs li:nth-child(2)').css('background-image')
  image_3 = $('.thumbs li:nth-child(3)').css('background-image')
  image_4 = $('.thumbs li:nth-child(4)').css('background-image')
  array = [image_1, image_2, image_3, image_4]
  
  $('.main').css('background-image', array[i])
  $('.right').click ->
    i += 1
    position = i % 4
    $('.main').css('background-image',  array[position])
  $('.left').click ->
    i -= 1
    position = i % 4
    $('.main').css('background-image',  array[position])
  $('.thumbs li').click ->
    i = $(@).index()
    position = i % 4
    $('.main').css('background-image',  array[position])
