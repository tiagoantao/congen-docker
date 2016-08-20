A docker machine for data analysis of genomics data
===================================================


This machine is used for a course in conservation genetics at the
University of Montana

How to run it
-------------


**Linux**

- Install docker

- Make sure the docker server is running

- Your user has to be on the docker group

- ``docker pull tiagoantao/congen-docker`` 

- ``docker run -p 6080:6080 -v /path_to_your_data:/data -t tiagoantao/congen-docker``

- Change `path_to_your_data` with the path to your data.

- Start a browser pointing to the address ``http://127.0.0.1:6080``

- Password is `congen16`



**Win/Mac**

- Install Kitematic (Docker Toolbox).

- Pull tiagoantao/congen_docker

- Run it

- Go to settings (see image below)

.. image:: Docker_screenshot.png

- Click on the 6080 port (see below)

.. image:: Docker_screenshot_portsetttings.png

- This should start a browser

- Password is `congen16`
