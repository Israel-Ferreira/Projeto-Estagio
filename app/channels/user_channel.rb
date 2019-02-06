class UserChannel < PinkmanChannel
  
  # TO DO: use connection/params and return an array of scopes (symbols) the current user can subscribe
  def current_allowed_scopes
    [:public]
  end
  
  # broadcast :public do |config|
  #   config.room :users
  # end
  
  # --- Quick Broadcast Guide
  
  # Start a broadcast here to transmit User.
  
  # Who consumes the transmission?
  # Everyone that subscribes to UserChannel and have a current_scope that is broadcasting something.
  
  # What gets broadcasted?
  # Every instance of User that gets created, updated or destroyed 
  # is broadcasted as json of the passed scope.
  
  # Optionally, you can use filter_by to restrict 
  # the transmission to a particular group of records.
  
  # --- Usage
  
  # -- js/coffe - client:
  #  App.controller 'any-controller', ->
  #    @main = ->
  #      
  #      @subscribe 'UserChannel',
  #        room: 'users'
  #        filter_by: 123
  
  # -- ruby / server: here (user_channel.rb)
  #  broadcast :public do |config|
  #    config.room :users
  #    
  #    config.filter_by :attribute
  #    # Only records that got `attribute == 123` will be broadcasted.
  #  
  #  end
  
end