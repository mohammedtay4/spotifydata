#Q4) Download tracks_features.csv from eLearn@USM. It contains audio features for over 1.2
# million songs. This dataset is taken from Kaggle website.
# Reference for these audio features can be found in the Spotify website.
# Since this is a dataset with about 1.2 million of rows and 24 columns.
# You are required to write a R program to split the CSV file into eight CSV files.
# You are required to use data frames in your implementation. After tracks_features.csv is split
# into eight CSV files, you need to import each of the CSV file into R and combine them as a data frame
# named complete.


#Please set the working directory according to your computer!

# Setting a working directory and loading the dataset to put it into the dataframe
setwd("/Users/Mohammed Tayfour/Desktop/Spotify 1.2M+ Songs")
track_data <- read.csv("tracks_features.csv") 

#Splitting the entire dataset by columns first
spotify <- track_data[,c(1 ,2, 3, 4)]
spotify2 <- track_data[,c(5, 6, 7, 8)]
spotify3 <- track_data [,c(9, 10, 11, 12, 13, 14, 15, 16)]
spotify4 <- track_data[,c(17, 18, 19, 20, 21, 22, 23, 24)]

#Now lets wanna split the mini-datasets by rows to upload in csv files
#spotify_i and spotify_v

spotify1 <- spotify[1:602012,]
write.csv(spotify1,"C:\\Users\\Mohammed Tayfour\\Desktop\\Spotify 1.2M+ Songs\\csv_files\\spotify_i.csv")

spotify5 <- spotify[602013:1204025,]
write.csv(spotify5,"C:\\Users\\Mohammed Tayfour\\Desktop\\Spotify 1.2M+ Songs\\csv_files\\spotify_v.csv")

#spotify_ii and spotify_vi

spotify_2 <- spotify2[1:602012,]
write.csv(spotify_2,"C:\\Users\\Mohammed Tayfour\\Desktop\\Spotify 1.2M+ Songs\\csv_files\\spotify_ii.csv")

spotify_6 <- spotify2[602013:1204025,]
write.csv(spotify_6,"C:\\Users\\Mohammed Tayfour\\Desktop\\Spotify 1.2M+ Songs\\csv_files\\spotify_vi.csv")

#spotify_iii and spotify_vii

spotify_3 <- spotify3[1:602012,]
write.csv(spotify_3,"C:\\Users\\Mohammed Tayfour\\Desktop\\Spotify 1.2M+ Songs\\csv_files\\spotify_iii.csv")

spotify_7 <- spotify3[602013:1204025,]
write.csv(spotify_7,"C:\\Users\\Mohammed Tayfour\\Desktop\\Spotify 1.2M+ Songs\\csv_files\\spotify_vii.csv")

#spotify_iv and viii

spotify_4 <- spotify4[1:602012,]
write.csv(spotify_4,"C:\\Users\\Mohammed Tayfour\\Desktop\\Spotify 1.2M+ Songs\\csv_files\\spotify_iv.csv")

spotify_8 <- spotify4[602013:1204025,]
write.csv(spotify_8,"C:\\Users\\Mohammed Tayfour\\Desktop\\Spotify 1.2M+ Songs\\csv_files\\spotify_viii.csv")

#Importing each csv file into R
i <- read.csv("spotify_i.csv")
ii <- read.csv("spotify_ii.csv")
iii <- read.csv("spotify_iii.csv")
iv <- read.csv("spotify_iv.csv")
v <- read.csv("spotify_v.csv")
vi <- read.csv("spotify_vi.csv")
vii <- read.csv("spotify_vii.csv")
viii <- read.csv("spotify_viii.csv")

#merging all imported csv into one dataframe called complete

#we start by merging spotify_iv and spotify_viii
d1 <- merge(x = iv, y = viii, by = c("X", "instrumentalness", "liveness", "valence","tempo","duration_ms", "time_signature", "year", "release_date"), all = TRUE)

#spotify_vii and spotify_iii

d2 <- merge(x = iii, y = vii, by = c("X", "explicit", "danceability", "energy", "key", "loudness", "mode", "speechiness", "acousticness"), all = TRUE)

#merging the first half (spotify_iii, spotify_iv, spotify_vii, spotify_viii)

half_1 <- merge(x = d1, y = d2, by = c("X"), all = TRUE)

#now that the first half is complete, let's merge the other half

#spotify_ii and spotify_vi

d3 <- merge(x = ii, y = vi, by = c("X", "artists", "artist_ids", "track_number", "disc_number"), all = TRUE)

#spotify_i and spotify_v

d4 <- merge(x = i, y = v, by = c("X", "id", "name", "album", "album_id"), all = TRUE)

#lets merge both to make the second half

half_2 <- merge(x = d4, y = d3, by= c("X"), all = TRUE)

#now that we have both halves, we can finally create the dataframe "complete"

complete <- merge(x = half_2, y = half_1, by = c("X"), all = TRUE)
complete$X <-NULL