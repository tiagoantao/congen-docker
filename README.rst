A docker machine for data analysis of genomics data
===================================================


This machine is used for a course in conservation genetics at the
University of Montana

How to run it
-------------


**Linux**

Install docker.

``docker pull tiagoantao/congen-docker`` 

``docker run -P -v /path_to_your_data:/data -t tiagoantao/congen-docker``

Change `path_to_your_data` with the path to your data.

**Win/Mac**

Install Kitematic (Docker Toolbox). Pull congen_docker
