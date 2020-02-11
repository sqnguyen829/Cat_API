require 'rest-client'
require 'pry'
require 'json'
#destroy_all will clear the sqlite db
User.destroy_all
Cat.destroy_all
Collection.destroy_all

#link to the api
url = 'https://api.thecatapi.com/v1/breeds'

#gets the API info
response = RestClient.get(url)

#converts the JSON data to readable ruby 
cats = JSON.parse(response)

#this take the cats array of cat and we make new cat in the cat table
cats.each do |cat|
    # puts cat["name"]
    #this conditional if and else is checking if there is a cat name 
    if cat['name']
        Cat.create(name: cat['name'], bio: cat['description'], origin: cat['origin'], friendly: cat['stranger_friendly'] )
    else
        Cat.create(name: 'N/A', bio: cat['description'], origin: cat['origin'], friendly: cat['stranger_friendly'] )
    end
end

u1 = User.create(username: 'Steven', password: 'test')
u2 = User.create(username: 'Tony', password: 'testing')
u3 = User.create(username: 'Lee', password: '123')

c1 = Cat.create(name:'Tabby', bio: 'Very happy cat', origin: 'Texas', friendly: 4)
c2 = Cat.create(name:'Sabby', bio: 'Very sad cat', origin: 'China', friendly: 3)
c3 = Cat.create(name:'Mabby', bio: 'Very mad cat', origin: 'England', friendly: 4)
c4 = Cat.create(name:'Fabby', bio: 'Very fast cat', origin: 'Germany', friendly: 2)
c5 = Cat.create(name:'Slabby', bio: 'Very slow cat', origin: 'Mexico', friendly: 1)

cl1 = Collection.create(name:'Lil S', user_id: u1.id, cat_id: c4.id)
cl2 = Collection.create(name:'Lil T', user_id: u2.id, cat_id: c3.id)
cl3 = Collection.create(name:'Lil M', user_id: u3.id, cat_id: c4.id)
cl4 = Collection.create(name:'Lil B', user_id: u2.id, cat_id: c1.id)
cl5 = Collection.create(name:'Lil F', user_id: u1.id, cat_id: c2.id)
cl6 = Collection.create(name:'Lil L', user_id: u2.id, cat_id: c5.id)
cl7 = Collection.create(name:'Lil P', user_id: u1.id, cat_id: c3.id)

