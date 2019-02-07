App.controller 'home', ->
  
  @main = ->
    users = new Users
    users.fetch (user) ->
      users.render('home')



  