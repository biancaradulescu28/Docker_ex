#  Containerize applicaton

For this exercise I choose the app.py file.

In the Dockerfile I added the received python file with the image python:3.9 and I declared the variable MY_ENV_VAR used in the main function.\
I built my image python-app and tested the dockerized application.
![Screenshot 2024-03-12 102411](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/ef5ed69d-a25d-4f80-8c09-9f3c80189d99)
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/c17c343b-ffdc-452e-a51e-dfa18fae5d0d)
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/75d68640-7c0d-4eed-ba9c-c4c061ccd382)
"Alexia" is the input I gave for the MY_ENV_VAR variable in the Dockerfile.

After creating a Docker Registry I pushed my python-app image with the tag python-app.
![Screenshot 2024-03-12 103700](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/58e54a6d-7d57-40e3-99e4-dfc7a3b0adbb)
![Screenshot 2024-03-12 103734](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/1202d464-c995-4f87-949d-357626a47301)

For the automation part of the exercise I created a main.yml file for the GitHub Actions:
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/8fdf1180-ba5c-4bc0-a528-505855904235)
To login to Docker I needed a password and username which I saved in repository secrets.
![Screenshot 2024-03-12 160252](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/349005e7-8efa-4bdf-aaf1-9bd66fb4e4c3)

In the following example I am changing the value of the MY_ENV_VAR variable to Bianca and pushing the changes.
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/5eab22bd-3573-43d8-8e5b-89aebf8dbf70)
All the tasks are completed successfully and the image is pushed to the registry.
![image](https://github.com/biancaradulescu28/Docker_ex/assets/92685311/5d40c572-eb64-420b-84b0-dbf020b143ce)










