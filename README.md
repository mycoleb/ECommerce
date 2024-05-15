Summary
For this assignment, you will design the DB for an Online Marketplace for a company you choose the name of. You will work on this project as a pair.



The DB should be able to track products, current inventory, transactions, reviews for products, and users who have signed up for an account on our website.

Go through the Analysis (collect and analyze requirements) and Logical modeling (implement ERD of entities, relationships, and attributes), and normalization phases of your DB design (part of Logical modeling).



Create the following:

The ER diagrams using the notation discussed in class / the book, that can be done in a tool of your choice. I recommend LucidChart. Models created in MySQL ER diagram creator will not be accepted. There are many reasons for this, primarily because you are more limited in customization. You may pick a different modeling tool with permission (email me). These will be non-normalized.


In the future, you will need to answer questions from this DB like:

List which products we currently have in inventory
Create new products
Modify the amount of a particular product that we have in inventory
Delete a product from inventory
Get a list of the most popular products for a given time range
Get a list of the least popular products for a given time range
Get a list of users who haven't purchased something in a few months to send promotional emails to
This should also include products that these users normally purchase


Required/Suggested items:

Have a minimum of 6 entities
Crows feet notation must be used
Cardinality must be defined, including relationship and attributes minimums and maximums.
Unique values should be indicated for Attributes.
Include documentation explaining which entities are Strong and which entities are Weak. Do not replace your crows feet notation with the diamond notation. Also, if you have any Supertype and Subtype entities, explain these in the documentation. I would like to see at least one supertype/subtype relationship.
Alternative option to documentation is to create a separate ER diagram with the diamond notation and supertype/subtype entities format.
If you have questions about the requirements of the DB please reach out to me.



Format Requirements
Please use LucidChart or another tool, other than MySQL ERD modeling. You may pick a different modeling tool with permission (email me). Submit these files as well as screenshots.


Assessment
Your diagrams will be graded on their accuracy, logical sense and normalization.



Deliverables
Please submit the Github repo with the diagrams in them as well as screenshots of the diagrams. If the file is done in Powerpoint, you do not need to submit screenshots.
Do not forget to make me and the TA a collaborator in your repo via our Github usernames:

EricLloydNSC-CS

gabistein



Appendix
ER Diagram Example:

Imagine a diagram for a simple library system.
Entities could include Book, Author, and Member.
Book could have attributes like BookID, Title, and Genre.
Author might have AuthorID, Name, and Bio.
Member could include MemberID, Name, and Email.
Relationships could show that a Book is written by an Author and borrowed by a Member.
Normalization (Boyce-Codd Normal Form):

Entities might be split into Books, Authors, and Members with primary keys.
Books entity could have a foreign key linking to the Authors table to establish the relationship without redundancy.
Additional entities might be used for many-to-many relationships (e.g., if a book can have multiple authors), such as an AuthorBook junction entity with foreign keys linking to both Authors and Books.
Rubric
