#/etc/passwd file manipulation

I downloaded ubuntu:latest image from Docker Hub:
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/787eb7fa-2fc2-4a61-bfce-ec87f3f8f937)

I ran the image to create and start the Linux container. After this, I created a new user john, and copied the given file in my container.
![Screenshot 2024-03-11 182635](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/35c8cce9-5392-4699-9bde-aee580de7927)
![Screenshot 2024-03-11 182649](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/e7ba4d20-ba57-40e5-bf80-9ee735efb6c3)

To see the format of the data in the passwd file I printed its contents:
![Screenshot 2024-03-11 190312](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/a6ee6758-9c09-4b45-8179-0aa48df46e8d)
Every task is written inside a function and all functions are called at the end of the file.
I also implemented error handling for each function.
This is the output of my bash script:
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/be2983b4-bbe1-4dd8-a19a-146e699da202)
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/dc1c55a3-5406-466b-8d6d-0bd9f1d2df90)
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/ff8edee0-4a69-45bf-aada-ddfb44292634)
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/bb83d598-25d9-4349-b56b-bbaf4ab5c5f1)
For the public key I needed to install curl tool:
apt-get update
apt-get install -y curl

![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/dc5a5b77-3a27-47e6-b96f-c36d468c61bd)

I also inserted comments within my script to explain some code choices.




