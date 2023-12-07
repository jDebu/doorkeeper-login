class ApiBaseController < ActionController::API
  before_action :doorkeeper_authorize!

  private

  def application
    # doorkeeper_token instance of Doorkeeper::AccessToken
    @application ||= OauthApplication.find_by(id: doorkeeper_token[:application_id])
  end

end