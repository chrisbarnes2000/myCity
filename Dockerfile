# Most of the time, Alpine is a great base image to start with.
# If we're building a container for Python, we use something different.
# Learn why here: https://pythonspeed.com/articles/base-image-python-docker-images/
# TLDR: Alpine is very slow when it comes to running Python!

# STEP 1: Install base image. Optimized for Python.
FROM python:3.7-slim-buster

# STEP 2: Set working directory to /app so we can execute commands in it
WORKDIR /app

# STEP 3: Copy the source code in the current directory to the container.
# Store it in a folder named /app.
ADD . /app

# STEP 4: Install required dependencies.
RUN pip install --upgrade pip && pip install -r requirements.txt

# STEP 5: Declare environment variables
ENV FLASK_APP=app.py \
    FLASK_ENV=production

# STEP 6: Expose the port that Flask is running on
EXPOSE 5000

# STEP 7: Run Flask!
# For example, to check every five minutes or so that a web-server is able to serve the site’s main page within three seconds:
# HEALTHCHECK --interval=5m --timeout=3s \
#     CMD curl -f http://localhost/ || exit 1
CMD ["flask", "run", "--host=0.0.0.0"]
