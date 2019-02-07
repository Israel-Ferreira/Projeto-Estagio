App.controller 'home', ->
  
  @main = ->
    users = new Users


    @render('home')