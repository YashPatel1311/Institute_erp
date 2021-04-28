# Institute Management System 🎓

An ERP software for Institutes and Colleges.

<img src="images/Institute.png">


## Installation ⚙️

1. Select ``` Data Import ``` & Import ```DB_Export.sql``` from My SQL workbench   

<img src="images/database.png">


2. Select ``` Import form self contained  file ``` & click on ``` Start import ```


<img src="images/database2.png">


3. Click on administration,then User and Privileges and then Create New User

<img src="images/database3.png">

5. Use **Usrename** :  ```dba``` & **Password** : ```dba@django```

<img src="images/database4.png">

6. Assign **DBA** Role to the user

<img src="images/database5.png">

7. Clone this repository 💥
```bash
git clone https://github.com/YashPatel1311/Institute_erp.git
```
8. Install ```requirements.txt``` 🎉
```bash
pip install -r requirements.txt
```

## Usage 📚

1. Go to ```Institute_erp``` directory
```bash
cd Institute_erp
```
2. Run this command 
```bash
python manage.py makemigrations
python manage.py migrate
```

3. Strat your server 🚀
```bash
python manage.py runserver
```

4. Now open your browser & open this URL 
```bash
127.0.0.1:8000
```

## Screenshots 🖼️
>**LogIn Page :**
>
><img src="images/LoginPage.png">

***

>### Faculty Module ###
>>   **FacultyHome Page :**
>>  <img src="images/FacultyHome.png">
>  
>>  **FacultyAllAttendance Page :**
>>  <img src="images/FacultyAllAttendance.png">

***

>### Student Module ###
>>  **StudentHome Page :**
>>  <img src="images/StudentHome.png">
>  
>>  **StudentAttendance Page :**
>>  <img src="images/StudentAttendance.png">
>  
>>  **StudentCourses Page :**
>>  <img src="images/StudentCourses.png">
>  
>>  **StudentMarks Page :**
>>  <img src="images/StudentMarks.png">

***


## Contributers 👨‍💻

[Darshan Patel](https://github.com/darshanpatel44)

[Yash Patel](https://github.com/YashPatel1311)

## License 📋
[MIT](https://choosealicense.com/licenses/mit/)
