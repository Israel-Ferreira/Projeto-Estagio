App.controller 'users-show', ->

  @bind ['nickname']
  
  @main = ->
    Users.one
      scope: 'public',
      query: @params.id
      callback: (user) -> 
        user.render('users-show')





