library(rdrop2)

.dstate <- new.env(parent = emptyenv())

refreshable_token <- drop_auth_refreshable()

token <- rdrop2::drop_auth()

token$refresh()

refreshable_token$refresh()

saveRDS(object = refreshable_token, file = "dev/token.RDS")
