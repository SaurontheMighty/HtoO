## HtoO NotUniversityHacks

## Inspiration
In all times of crisis such as floods, natural disasters and pandemics like the one we are experiencing now, essential supplies are in large demand. In such a time it is very important for people to be able to get access to these supplies. We wanted to build an app that allowed people to quickly and efficiently find the stores which had the supplies they needed, basing the ideas off issues we all personally felt during these troubling times.

## What it does
H to O is a comprehensive app, which allows people to find the essential supplies closest to them. When you open the app you are greeted with an interactive map that shows you nearby stores that carry the supplies you need. You can see the inventory by clicking on the store's icon and clicking the popup with the inventory automatically shows the directions to the store. The Shopping List page allows you to add the items you require and when you click to confirm, it efficiently runs through every nearby store's inventory and finds the closest one that meets your demand and shows you their location on the map. Finally, a Tips page educates users on the water crisis, raises awareness, and directs them to resources where they can learn more about it!

## How we built it
We built H to O using Flutter, a relatively new SDK backed by Google that harnesses Dart. We chose to stick with Google for the database as well, opting with Cloud Firestore to house each store's inventory. We used the Google Maps API for the map which provided us with the tools necessary to make a very appealing map that any user can navigate around and understand. Using an API like Google Maps which is still in Developer Preview was an interesting experience.

## Challenges we ran into
Storing data in Firestore and then populating it as markers on the map was challenging. Getting the type of item the user wanted and then animating to maps page and showing the store was also challenging. Reading data from and writing data to the database was quite challenging as we had to keep track of each document and make sure we were pulling from the right parent. This was only our second time using Flutter to make an app, so we ran into many syntax related issues due to us being relatively new to it. Furthermore, the Maps API for Flutter is still in active development and we were running into many issues that the development community was unable to solve as well.

## Accomplishments that we're proud of
Given our short history with Flutter Development and little to none with Firestore and the Maps API, we are very proud of what we were able to accomplish in such a short period of time. From the get-go, we were organized and approached the intimidating task with an optimistic mindset that helped us persevere through bugs and issues that seemed almost impossible to solve. NotUniversityHacks has provided us with an amazing opportunity to learn and develop our skills, and we had a blast talking and connecting with like-minded individuals in the Discord server!

## What we learned
This was a very rewarding experience for us as we used technologies we were not very familiar with. Everything we did teach us a little more about what we were using and how we can apply it in the future. We used the Google Maps API for our project which we were completely new to and had to learn how to use it as we went along. Using Google Maps API for the first time taught us a lot about using maps, formatting of markers, populating data on the maps from an external database. Moreover, Cloud Firestore means that in the future we have a reliable database to store information, and now we know how to read and write to the database.

## What's next for H to O
As a concept, we kept H to O limited in the number of items the user is able to search, and the locations nearby. The database is fully capable of expansion, so in the future, we plan to expand this data to include more stores around the world. We hope that we will be able to help those in need of essential goods during times of crisis and be successful in our mission to spread awareness. We also hope that local business owners will see this app as an opportunity to boost sales and keep essential items in stock for the betterment of the local community. We can't wait to see where H to O goes!

## Our Submission for the domain.com Prize:
We are building a landing page for our Flutter app: h2go.tech
