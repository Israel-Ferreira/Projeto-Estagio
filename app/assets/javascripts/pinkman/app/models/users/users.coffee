class window.Users extends AppCollection
  config:
    api: 'api/users' # you should confirm this
    className: 'Users'
    memberClass: ->
      return (new User)
