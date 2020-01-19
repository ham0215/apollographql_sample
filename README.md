# apollographql_sample
This is sample using apollographql.


# bff, backend rails new

```
bundle exec rails new . --database=mysql --skip-action-mailer --skip-action-mailbox --skip-action-text --skip-active-storage --skip-spring --skip-turbolinks --skip-bootsnap --skip-test --force --api
```

bffはdatabaseなしでよかった


# 構成

```
Front[react, apollo] <-(graphql)-> BFF(rails) <-(gRPC)-> Backend[rails] <-> MySQL
                                              <-(...)-> Auth
```

# grpc
下記を使用
https://github.com/grpc/grpc

back/lib/protos配下にprotoを作成

コマンドを実行してrbを作成

```
grpc_tools_ruby_protoc -I lib/protos --ruby_out=lib/grpc --grpc_out=lib/grpc lib/protos/helloworld.proto
```

生成されたファイルのrequireに'grpc/'をつける。`require 'grpc'`は不要なので削除。

bffにコピー

```
cp -p backend/lib/grpc/* bff/lib/grpc/
```

サーバー起動

```
rails runner bin/greeter_server.rb
```

クライアントからアクセス(rails console)

```
require 'grpc/helloworld_services_pb'
stub = Helloworld::Greeter::Stub.new('back:3000', :this_channel_is_insecure)
message = stub.say_hello(Helloworld::HelloRequest.new(name: 'world')).message
p "Greeting: #{message}"
```
