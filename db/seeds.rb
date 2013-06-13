Album.delete_all
Artist.delete_all
Genre.delete_all
Song.delete_all
User.delete_all


album1, album2, album3 = ['The White Album', 'Fair Warning', 'The Wall'].map do |name|
	Album.create(name: name)
end

artist1, artist2, artist3 = ['The Beatles', 'Van Halen', 'Pink Floyd'].map do |name|
	Artist.create(name: name)
end

genre1, genre2, genre3 = ['Classic', 'Hiphop', 'Heavy Metal'].map do |name|
	Genre.create(name: name)
end

song1, song2, song3 = ['Glass Onion', 'Beat Streets', 'Comfortably Numb'].map do |name|
	Song.create(name: name)
end

#user1, user2, user3 = ['zlu', 'omar', 'max'].map do |name|
#	User.create(name: name)
#end

mike = User.create(name: 'mike', password: 'mike', email: 'mike@example.com', admin: true)
omar = User.create(name: 'omar', password: 'omar', email: 'omar@example.com', admin: false)
dylan = User.create(name: 'dylan', password: 'dylan', email: 'dylan@example.com', admin: true)


#.each would only return the string of the object, whereas
#.map creates a new array. (? - look into this more)

#artist1.songs is an array, which is why you can use <<
#to push song1 (a string) into the array.
artist1.songs << song1
artist2.songs << song2
artist3.songs << song3

album1.songs << song1
album2.songs << song2
album3.songs << song3

genre1.songs << song1 << song2
genre3.songs << song3

mike.albums << album1 << album2 << album3
omar.albums << album1 << album2




