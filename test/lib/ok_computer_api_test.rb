require 'test_helper'

class OkComputerApiTest < ActiveSupport::TestCase
  test "#all" do
    ok_computer_api = OkComputerApi.new(
      endpoint: "https://foo.com/okcomputer/all",
      username: "username",
      password: "-secret-"
    )
    result = {
      "default"=>{
        "message"=>"Application is running", "success"=>true, "time"=>3.604218363761902e-06
      },
      "database"=>{
        "message"=>"Schema version: 20200325172040", "success"=>true, "time"=>0.002504512667655945
      }
    }

    VCR.use_cassette("ok_computer") do
      assert_equal(result, ok_computer_api.all)
    end
  end
end
