class ClientsController < SecureController
  def index
    authorize :client, :index?
    @clients = policy_scope(Client)
  end
end
