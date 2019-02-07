App.controller 'users-new', ->
  
  @bind['nickname']

  @main = ->
    user = new User
    @render('users-new')

  @action 'user-form', 'submit', (user) ->
    if user.hasErrors()
      post.render()
    else
      $r.go '/'