class Interceptor::LoggingInterceptor < GRPC::ServerInterceptor
  def request_response(request: nil, call: nil, method: nil)
    Rails.logger.info("start #{method.owner}##{method.name}") if method
    Rails.logger.info("request: #{request.to_json}") if request
    yield
  end
end
