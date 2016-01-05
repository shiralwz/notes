class NoteAppAPI < Grape::API
  format :json
  helpers do
    def authenticate_user!
      begin
        payload, _ = JWT.decode(params[:token], 'key')
        # binding.pry
        @current_user = User.find_by_id(payload['user_id'])
      rescue StandardError
      end
      error!({error: 'unauthorized access'}, 401) if @current_user.nil?
    end

    def current_user
      @current_user
    end
  end
  mount UserAPI
  mount SessionAPI
  mount NoteAPI
end
