<h1 align="center">Bookhub</h1>

an online bookstore build on express and mariadb

#### scrennshots

![scrennshot](./screenshot/bcg1.png "screenshot1")

![scrennshot](./screenshot/bcg2.png "screenshot2")

![scrennshot](./screenshot/bcg3.png "screenshot3")

#### directory

```
|- api/     captcha function
|- public/  public files including images and static pages
|- views/   dynamic pages, some ejs files
|- routes/  route control, only the index.js is used
|- bin/     express standard module
app.js      express standard module
```

#### how to deploy

+ database

```sql
// first connect to your mysql or mariadb
create database bookhub;
use bookhub;
source {path to the project directory}/database/database.sql
```

+ project

make sure you have nodemon installed or you should edit the package.json

```shell
npm install
npm run dev
```

