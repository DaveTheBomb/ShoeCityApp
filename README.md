How to run the application

1.  Start up the database server using Docker:
    CD to the directory where the docker-compose.yml file is saved and run the foollowing command on the terminal. 
    ```cmd
        docker-compose up
    ```

2. Start up the website engine: 
    CD to the directory in the Javascript folder and run the following command:

    ```cmd
        npm run dev
    ```
   

Alternatively:  To run the the application and database on containers use:
```cmd
        docker-compose -f docker-compose.database.yml -f docker-compose.application.yml up
```