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
