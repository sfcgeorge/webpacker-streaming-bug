class StreamingsController < ActionController::Base
  def show
    render plain: 'Hello, World!', stream: false, layout: false
  end
end
