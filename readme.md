# Expert-Search-API

An API for searching experts for topics based on provided requirements

## How to run
#### Tested on Ruby v2.6.3 / Rails v6.0.2.2

- As the API is not at all critical, I have included my api key in the `.env` file

### Using Docker
- Pull docker container `addauda/expert-search:latest` from docker hub registry
- Run container with the following command `docker run --rm -it -p 3000:3000/tcp addauda/expert-search:latest`
- Send requests to API as per [API documentation](documentation.md)

### Using Local
- Install dependencies with `bundle install`
- Start puma webserver using `rails s`
- Send requests to API as per [API documentation](documentation.md)

# My Approach To Challenge

### Assumptions / Conclusions
- Creating a new member
  - As per requirement, the API expects a name and personal website. It returns the record it created, and starts an Active Job to sync the rest of profile data (topics and url shortening). My intuition behind the async job was to allow the user to get a response, regardless of timeouts/other issues with external HTTP calls. As a next step, the API should allow for requeue, notifications in case of failure.
  - As the bitly API is not at all critical (assessment environment), I have included my api key in the code.
  
- Searching for a topic from experts not in user's 1st degree
  - Due to time, for this feature I could only implement a search algorithm which assumes that experts for a topic not in the user's network are at most mutual with one of his/her friends (2nd degree level)
  

### Improvements
- Add recursion to search algorithm to traverse friends networks
- Leverage memoization to cache intemediary results while doing recursion
- I could have chosen a better way model to friend relationships to make traversing network easier. I found I had to prioritize maintaining referential integrity in this case so it might have complicated my logic.
- Implemented automated unit tests in rails, instead I ran postman tests

### Task Breakdown
- Working on models - **45 mins**
- Working on controllers logic for features - **1.5 hrs**
- Working on Jbuilder response views - **20 mins**
- Working on Sync Profile job - **45 mins**
- Bitly API Integration - **10 mins**
- Nokogiri Integration - **10 mins**
- Postman Tests - **20 mins**
- Dockerizing - **10 mins**
- Documentation & Cleanup - **20 mins**

### What I Found Most Challenging
- Dealing with nested associations and some computations in responses without JBuilder.
- Thinking about trade-offs when modelling friendships as it could have two foreign keys to the same model

### My Eureka Moment :O
I was initially working with nested hashed responses and found that accesing specific associated models and performing computation was a bit challening. I had quickly skimmed JBuilder and did a quick test to see how I could use it to render responses and it turned out to be pure magic! It drastically sped up my development time.