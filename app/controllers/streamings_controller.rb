class StreamingsController < ActionController::Base
  def show
    render plain: 'Hello', stream: true, layout: false
  end
end
