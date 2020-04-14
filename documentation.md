## Models
- Member
- Friend
- Topic

## API Endpoints
---
- ### Create a new member

  | Verb     | Route       |
  | -------- | ----------- |
  | **POST** | `/members/` |

  **Request Body** 

    ```
  	{
  		"name": "Ahmed Dauda", //string
		"website": "https://nokogiri.org/tutorials/installing_nokogiri.html" //string
  	}
  	```

  **Responses**

	- 201 CREATED 
  
    	```
    	{
			"id": 1, //integer
  			"name": "Ahmed Dauda", //string
			"website": "https://nokogiri.org/tutorials/installing_nokogiri.html" //string
  		}
    	```

---

- ### Retrieve all members

  | Verb    | Route       |
  | ------- | ----------- |
  | **GET** | `/members/` |

  **Request Body** - None

  **Responses**

	- 200 OK 

		Sample response
    	```
    	{
    		"id": 1, //integer
        	"name": "Ahmed Dauda", //string
			"short_url": "https://bit.ly/2Rv3XhV", //string
			"number_of_friends": 3 //integer
		}
  		```

---

- ### Retrieve a particular member

  | Verb    | Route           |
  | ------- | --------------- |
  | **GET** | `/members/:id/` |

  **Request Body** - None

  **Responses**

	- 200 OK

		Sample response
    	```
    	{
    		"id": 1, //integer
        	"name": "Ahmed Dauda", //string
			"website": "https://www.tutorialspoint.com/ruby-on-rails/rails-active-records.htm", //string
			"short_url": "https://bit.ly/2Rv3XhV", //string
			"topics": [
				{ 
					"heading_tag": "h2", //string
					"content": "building models" //string
				} ...
			],
			"friends": [
				{ 
					"name": "Bob Smith", //string
					"short_url": "https://bit.ly/2Rv3XhV" //string
				} ...
			]
		}
  		```

	- 404 NOT FOUND

---

- ### Create a friendship between two members

  | Verb     | Route       |
  | -------- | ----------- |
  | **POST** | `/friends/` |

  **Request Body** 

	```
  	{
  		"member_id": 1, //integer
		"friend_member_id": 2 //integer
  	}
  	```
  **Responses**

    - 200 OK
    	```
		{
  			"from": 1, //integer
			"to": 2 //integer
  		}
		```

---

- ### Search for a topic from an expert outside 1st degree network

  | Verb    | Route                   |
  | ------- | ----------------------- |
  | **GET** | `/search/:id?query=XXX` |

  **Request Body** - None

  **Responses**

    - 200 OK
    	```
		[
			{
				"member_id": 1, //integer
				"short_url": "https://bit.ly/2Rv3XhV", //string
				"content": "Building Models", //string
				"path": "Ahmed --> Bob --> John" //string
			} ...
		]