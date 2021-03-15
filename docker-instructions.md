- Build the image:

   `docker build -t flask-image .`

- Build the container:

   `docker run -p 5000:5000 --rm --name flask-container flask-image`

- Remove all images with names that contain `flask`

   `docker images -a | grep "flask" | awk '{print $3}' | xargs docker rmi`

- Remove all containers with names that contain `flask`

  `docker ps -a | grep "flask" | awk '{print $3}' | xargs docker rmi`
