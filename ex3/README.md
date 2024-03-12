# Query a MySQL database

I started by pulling a mysql image from Dockerhub, then I created the container and checked that it was running properly by selecting the users.
![Screenshot 2024-03-12 125946](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/9660bfe2-c26a-424c-93c6-36a7bfd66b50)
![Screenshot 2024-03-12 130610](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/6167ff85-c663-4f12-b443-638d6f84b3d2)
![Screenshot 2024-03-12 130741](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/c77b7842-3047-4bea-8880-06e4414bf7cf)

Then I made the connection between the container and MySql Workbanch with the IP of the container and the port it is running on.
![Screenshot 2024-03-12 132143](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/f169f2e7-fe12-45e7-be03-342416e9d277)

I created the database company and checked the connection.
![Screenshot 2024-03-12 132455](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/30e4bf28-410b-442d-95da-3758ebbe6af3)
![Screenshot 2024-03-12 132506](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/ee889dde-3999-4e76-acc0-98966c979a50)

When trying to import the company.sh file I received the following error.
![Screenshot 2024-03-12 134151](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/bd53cff2-9611-47d1-93bb-29009fef6884)
After checking the content of the company.sh file I changed the field that was giving the error from Consulting to 7 (the id of department Consulting in the departments table).
![Screenshot 2024-03-12 134239](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/60d8e0bb-4076-45db-9472-448fe4103bf9)
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/fae4d2c0-161c-4232-b4e1-75be2689d0e6)
After this, I was able to import the file by first copying it into the container and then using the contents for the company database.
![Screenshot 2024-03-12 134659](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/475324db-1301-4984-8b28-827777be6621)
![Screenshot 2024-03-12 134717](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/87802400-46b8-46ba-99f2-2e5e8aedef69)
I created user bianca and granted all permissions for the database company.
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/e38930f7-aea0-41d2-aff3-a6375c1ec3af)
To find the average salary for each department I also joined the tables employees and departments to show the name of each department:
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/6e02edcf-6a1e-4d4f-b89c-0b8c1b1de58b)
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/0dfc7b6e-3aa0-4e10-9d47-f7f43933c0fb)












