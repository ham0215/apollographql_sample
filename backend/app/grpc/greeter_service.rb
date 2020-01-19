require 'grpc/helloworld_services_pb'

class GreeterService < Helloworld::Greeter::Service
  # say_hello implements the SayHello rpc method.
  def say_hello(hello_req, _unused_call)
    Rails.logger.debug('start say_hello')
    Rails.logger.debug(hello_req.inspect)
    Helloworld::HelloReply.new(message: "Hello #{hello_req.name}")
  end
end
