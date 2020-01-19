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

back/lib/protos配下にprotoを作成

コマンドを実行してrbを作成

```
grpc_tools_ruby_protoc -I lib/protos --ruby_out=app/grpc --grpc_out=app/grpc lib/protos/helloworld.proto
```

生成されたファイルが自動ロードされるようにhelloworld.rb１ファイルにまとめる

bffにコピー

```
cp -p back/app/grpc/helloworld.rb bff/app/grpc/
```

サーバー起動

```
rails runner bin/greeter_server.rb
```

クライアントからアクセス(rails console)

```
stub = Helloworld::Greeter::Stub.new('back:3000', :this_channel_is_insecure)
user = 'world'
message = stub.say_hello(Helloworld::HelloRequest.new(name: user)).message
p "Greeting: #{message}"
```