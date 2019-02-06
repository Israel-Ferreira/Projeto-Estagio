class Api::UsersController < ApiController

  before_action :verify_permissions
  before_action :set_objects

  # get api/users
  def index
    users = User.limit(current_limit).offset(current_offset)
    render json: users.json(requested_scope)
  end

  # get api/users/:id
  def show
    render json: @user.json(requested_scope)
  end
  
  # get api/users/get
  def get
    users = User.get(handle_query_param)
    render json: users.json(requested_scope)
  end
  
  # --- TO DO: Revise this ---
  def handle_query_param
    if params[:query].is_a? ActionController::Parameters 
      params[:query].permit!
      params[:query].to_h
    else
      params[:query]
    end
  end

  # get api/users/search/:query
  def search
    if params[:query].present?
      users = User.search(params[:query]).limit(current_limit).offset(current_offset)
      render json: users.json(requested_scope)
    end
  end

  # post api/users
  def create
    @user.assign_attributes user_params
    @user.save
    render json: @user.json(requested_scope)
  end

  # put/patch api/users/:id
  def update
    @user.update user_params
    render json: @user.json(requested_scope)
  end

  # delete api/users/:id
  def destroy
    @user.destroy
    render json: @user.json(requested_scope)
  end

  protected

  # --- begin permissions  --- #

  def verify_permissions
    unless requested_scope.in?(allowed_scopes) and UserSerializer.scope(requested_scope).can_access? action_name
      render json: {error: 'Unauthorized'}, status: :unauthorized
    end
  end

  # --- end permissions  --- #

  def set_objects
    if params[:id].present?
      @user = User.find params[:id]
    else
      @user = User.new
    end
  end

  def user_params
    if params['pink_obj']
      params["pink_obj"].keep_if {|k,v| UserSerializer.scope(requested_scope).can_write?(k)}
      params["pink_obj"].permit!
    else
      {}
    end
  end

end
