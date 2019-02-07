App.controller 'users-new', ->
  
  @bind ['nickname']

  @main = ->
    user = new User
    user.render('users-new')

  @action 'user-form', 'submit', (user) ->
    console.log user.nickname
    user.save (user) -> 
      if user.hasErrors()
        user.render()
      else
        $r.go '/'