#see httr package for more details/tutorial
#https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
#install.packages('httr')
library(httr)

#request page from wikipedia
requestWiki <- GET('https://en.wikipedia.org/wiki/Donald_Duck')
print(requestWiki)

#request page from weather underground
requestWU <- GET('https://www.wunderground.com/weather/us/ia/ames/50010')
print(requestWU)

###########################
#Request data from NASS API
###########################

#save API key - you can request a NASS API key (it's instant) from https://quickstats.nass.usda.gov/api
key = '?key=paste your key here' 

#save url that we want to request data from, in this case the NASS API url
url = 'http://quickstats.nass.usda.gov/api/api_GET/'
#request data for commodity corn, years >= 2012, IA and in CSV
commodity = '&commodity_desc=CORN&year__GE=2012&state_alpha=IA&format=CSV'
#save the url and commodity as the 'complete' url so we can request it
requestURL = paste(url,key,commodity, sep ='')
print(requestURL)

#check to see if request works
#200 = good. Some responses indicating an error are 404, 403, and 500.
nassRequest = GET(requestURL)
http_status(nassRequest)

#save the content of the request to a variable
dat <- content(nassRequest, "text", encoding="UTF-8")
#write content to csv!
writeBin(dat, "mydat.csv")

#you can explore more APIs here: https://www.programmableweb.com/

