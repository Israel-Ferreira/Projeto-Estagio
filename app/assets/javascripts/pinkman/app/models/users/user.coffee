class window.User extends AppObject
  config:
    className: 'User'
    api: 'api/users' # you should confirm this
  
  constructor: (args...) -> 
    super(args...)
    @routes =
      show: =>
        "/users/#{@id}"
      
      new:  => 
        "/users/new"
      


