Executing Different Firebase Queries




So first you need to order the data by something specific, in the firebase_database we have the following methods:
orderByValue: Generate a view of the data sorted by value, intended to be used in combination with startAt, endAt, or equalTo.
orderByPriority: Generate a view of the data sorted by priority, intended to be used in combination with startAt, endAt, or equalTo.
orderByChild: Generate a view of the data sorted by values of a particular child key, intended to be used in combination with startAt, endAt, or equalTo.
orderByKey: Generate a view of the data sorted by key, intended to be used in combination with startAt, endAt, or equalTo.
Note: You cannot use two orderBy.. methods in the same query.
The method orderBy.., can be used with the following methods:
startAt: Create a query constrained to only return child nodes with a value greater than or equal to the given value.
endAt: Create a query constrained to only return child nodes with a value less than or equal to the given value.
limitToFirst: Create a query with limit and anchor it to the start of the window.
limitToLast : Create a query with limit and anchor it to the end of the window.
Now, if you use the following query:
dbRef.orderByChild("age").equalTo("4").once(),
Then you will get only the nodes that have age equal to 4:


dbRef.orderByKey().equalTo("-M0FIuRBi5NT1VKsTbQt").once(),
If you use the above query, then you will retrieve the node that contains the key -M0FIuRBi5NT1VKsTbQt


for way more info scroll down on: https://medium.com/firebase-tips-tricks/how-to-use-firebase-queries-in-flutter-361f21005467
