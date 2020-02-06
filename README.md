# phplist benchmark

Run a phplist benchmark using this project.

### Requirements

Ideally a project that can run anywhere, as such docker is used with :

- mailcatcher to run a dummy SMTP server
- php cli
- mysql
- composer is used to initialised the project
- make, always use make as a step/task wrapper

## Boot up

`make up` 

starts the containers, initialises db, mailcatcher and creates the php list base project.

#### TODO

- add faker through composer
- add sample configuration to be moved in the project after composer install is completed
- add a script to auto generate 
	- a list with X amount of subscribers
	- campaigns with emails ready to go out
- script to start benchmarking by adding campaigns
- blackfire for APM data