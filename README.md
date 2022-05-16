# JPA CRUD Project

## Description:

This full stack project utilizes a single table database generated using MySQL Workbench.
users have full CRUD (Create, Read, Update, Delete) control of items in the database.
The table is based on a family tree concept, where rows in the table represent members of a family. All members may have a mother, father and spouse related to them in the table using the update/add member features of the program. If a member is deleted, all related records will be cleaned, removing references to their id (mother, father or spouse). Users may also search members using first name, last name or their database id. The name search will return a list of matching family members, and id will return the single member with that id.

## Lessons Learned:
I learned many lessons with this project, as I believe it was the most challenging one so far in the SD program.

* Not all sql queries are legal when working with hibernate/jpa. The member page will show any direct family members to the member in question. Originally, I was attempting to use self join queries to collect the data from the member table. For reasons still unknown to me, the queries that worked in MySql, with appropriate modifications, did not work with hibernate. Because of this, I had to split work that could have been done in a single method out to several.

* Another thing I learned was that I  could not have multiple transactions acting in the same method(another hibernate/jpa feature). This meant I  needed two separate methods to delete a member -  one that removed them from the database, and another that cleaned the related records.

* Typos will be the death of me when all the data is carried in strings. I've spent no less than 5 hours staring at and adjusting my code only to realize that "fistName" != "firstName". When working with variables, the IDE can detect errors in my code.

## Technology Used:

* Eclipse IDE
* Java
* MySql/MySql Workbench
* MAMP
* Tomcat Server
* Spring Boot
* HTML/CSS
