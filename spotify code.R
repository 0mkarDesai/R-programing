library('spotifyr')
Sys.setenv(SPOTIFY_CLIENT_ID = '682e64c55e974facae02c15732ab691a')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '242f71ec927446c487fe94347cbcc0fb')
access_token <- get_spotify_access_token()
SOAD <- get_artist_audio_features('System Of A Down')

#system of a down is a great band but curse words can be bad for kids so lets delete songs with curse words
SOADclean <- SOAD[SOAD$explicit==FALSE]
library(dplyr)
SOADclean <- SOAD%>%
  filter(explicit==FALSE)

#kids like tempo of songs which are between 60-120, so we will sort it out
SOADcleanT<- subset(SOADclean,tempo>=60 & tempo<=120)

#the vocal range of kids is good but some keys are easy to sing
# age 3-5 = C Major and G Major
# age 6-11 = D Major, A Major, C Major and G major
# age 12-18 = F Major, Bb Major. D major, A major, C Major and G major
#inorder to determine that the dataframe has the keys and also sort songs for kids singing keys
kids_keys <- subset(SOADcleanT, key_mode %in% c("F major","Bb major","D major","A major","C major","G major"))
if (nrow(kids_keys) > 0) {
  print("The dataframe has subvalues that match the criteria.")
} else {
  print("The dataframe does not have subvalues that match the criteria.")
}
#""The dataframe has subvalues that match the criteria."
#lets sort the songs according to the age range
age3to5 <- subset(kids_keys, key_mode %in% c("C major","G major"))
if (nrow(kids_keys) > 0) {
  print("The dataframe has subvalues that match the criteria.")
} else {
  print("The dataframe does not have subvalues that match the criteria.")
}
remove(kids_keys)

age6to11<- subset(SOADcleanT, key_mode %in% c("D major","A major","C major","G major"))
if (nrow(kids_keys) > 0) {
  print("The dataframe has subvalues that match the criteria.")
} else {
  print("The dataframe does not have subvalues that match the criteria.")
}
age12to18 <- subset(SOADcleanT, key_mode %in% c("F major","Bb major","D major","A major","C major","G major"))
if (nrow(kids_keys) > 0) {
  print("The dataframe has subvalues that match the criteria.")
} else {
  print("The dataframe does not have subvalues that match the criteria.")
}
