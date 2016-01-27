con <- dbConnect(dbDriver("MySQL"), dbname="big_data", user="root", password="password")
find_cgr <- "select * from clawl_github_repositories"
find_cgr_java <- paste(find_cgr," where language = 'java';")
big_data.cgr <- dbGetQuery(con, find_cgr_java)

ids <- big_data.cgr$id
stars <- big_data.cgr$stargazers_count

hist(stars)
par(new=T)
plot(density(stars),col="red")
axis(side=4)
