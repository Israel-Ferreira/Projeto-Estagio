App.controller 'users-show', ->
  
  @main = ->
    Users.one
      scope: 'public',
      query: @params.id
      callback: (user) -> 
        user.render('users-show')





