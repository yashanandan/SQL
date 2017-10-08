# SQL
## SQL Schemas for Task 1

Disclaimer : I have taken a crude view of a basic database and created the schema. This may not be the best schema for the application and will need tweaking in the future, but this can certainly be the base for the database schema.

**1. Choice of Database**

MySQL will be my choice of database.
- It has a rich community following, with good technical support and updates
- It is highly scalable and customizable
- It is open source and still provides the best security, and ACID properties of DBs
- Easy to deploy and use.

**2. Schema Details**

#### Table - Users
Stores the details of the users. User has to be registered in order to perform any transaction. ( Need not be logged in when searching )

#### Table - Transaction Types
The different types of transactions are stored, any new type of transaction can be inserted or old ones be removed.

#### Table - Businesses
A user lists their businesses and the data is stored in this table. The user is not linked to this table as user may perform multiple similar actions on the same business. So the user is linked to the business in the User Business Transaction Table

#### Table - Roles
A user is assigned roles. Each role has a set of permissions. This comes in useful when there are premium features for users, certain users can have restricted features comapred to the others

#### Table - Permissions
Any action like logging in, Posting a business listing or any transaction must have a defined permission. This level of granularity may not be required at an early stage but as more features and tweaks are added permissions will play a vital role.

#### Table - User Roles
User are linked to roles here. This is kept in a seperate table as new roles can be added or removed for a user. Also a user can have multiple roles

#### Table - Role Permissions
The permissions for each role is given here, new permissions can be added or permissions can be removed. This gives flexibility over what the users sees and gives more structure to the database.

#### Table - User Transaction Business
This will be the main table (this table can be further divided into smaller granularity) the user, business, and the transaction he wises to perform on the business are all inked here offering a one stop place. This table can further contain the progress of the transaction.

**3. What more can be added (not an exhaustive list will add when more ideas strike)**

- A table which contains the progress can be added. This progress table can be linked to User Transaction Business table to see how far the transaction has gone
- Business listing can be further split, I have maintained a column 'business_details' which stores the meta data of the business, this can furhter be divided based on employee strength, how old the business is, its valuation, etc. 
