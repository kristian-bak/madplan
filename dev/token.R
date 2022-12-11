mytoken <- rdrop2::drop_auth(new_user = TRUE)
saveRDS(object = mytoken, file = "dev/token.RDS")
