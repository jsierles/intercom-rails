require 'test_setup'

require 'action_controller'
require 'action_controller/test_case'

TestRoutes = ActionDispatch::Routing::RouteSet.new
TestRoutes.draw do
  get ':controller(/:action)'
end

class ActionController::Base

  include IntercomRails::CustomDataHelper
  after_filter IntercomRails::AutoIncludeFilter

  include TestRoutes.url_helpers
  include TestRoutes.mounted_helpers

end

class ActionController::TestCase

  def setup
    super
    @routes = TestRoutes
  end
  
end
