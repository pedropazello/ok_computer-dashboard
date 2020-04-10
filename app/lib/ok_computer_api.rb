class OkComputerApi
  attr_reader :endpoint, :username, :password

  def initialize(endpoint:, username: nil, password: nil)
    @endpoint = endpoint
    @username = username
    @password = password
  end

  def all
    response = HTTParty.get("#{endpoint}.json", :basic_auth => auth)
    JSON.parse(response.body)
  end

  private

  def auth
    {:username => username, :password => password}
  end
end
