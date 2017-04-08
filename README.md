# GeoGutenberg
## Semester project for database course 2017
#### Mads Dam Eckardt Jensen

### The project
The task for the semester project in the database course is to build a small application that allows to figure out which cities are mentioned in which English books from Project Gutenberg and given a city which books mentioned it.

In essence, your application will support the following basic queries:

#### Types of queries
1. Given a city name your application returns all book titles with corresponding authors that mention this city.
2. Given a book title, your application plots all cities mentioned in this book onto a map.
3. Given an author name your application lists all books written by that author and plots all cities mentioned in any of the books onto a map.
4. Given a geolocation, your application lists all books mentioning a city in vicinity of the given geolocation.

The input data for your application are all English books from Project Gutenberg, see http://www.gutenberg.org. Amongst others, they provide public domain books as plain text files. A description on how to automatically download these books is given here: https://www.exratione.com/2014/11/how-to-politely-download-all-english-language-text-format-files-from-project-gutenberg/. Based on this, I provide a machine configuration which allows you to download all the books via a Digitalocean Droplet https://github.com/HelgeCPH/db_course_nosql/tree/master/book_download. Alternatively, you can get all the books from a USB key in class.
A CSV file with many cities and their geolocations is avalable from www.geonames.org http://download.geonames.org/export/dump/ where we are especially interested in file http://download.geonames.org/export/dump/cities15000.zip or http://download.geonames.org/export/dump/cities5000.zip
You write a program that scans each book, i.e., each text file and extracts all city names. For this task a heuristic is good enough. That is, it is okay if you miss cities with extravagant names.
Your databases store thus, author names, book titles, and names of cities, their geolocations and their occurences in texts.
The frontend of your application does not matter too much. That is, a CLI application is as well as a web-application.

#### Goal
Build an Application with Various Databases
The goal of the project is, that you build the above application in a way, so that you can exchange the underlying database engine.
In the class, we covered three database paradigms. Relational, graph, and document-oriented databases. You build your application with at least two databases from two different paradigms, for example, MySQL and Neo4j, MySQL and MongoDB, Neo4j and MongoDB, etc.
#### Measure Application Behavior
Subsequently, you define a set of test queries with at five queries per type, see above section (Types of queries). That is, in total your query test set contains at least 20 queries.
Now, you meassure the reponsiveness of your application with respect
#### Report Results
Report:
Which database engines are used.
How data is modeled.
How data is imported.
Behavior of query test set.
Your recommendation, for which database engine to use in such a project for production.