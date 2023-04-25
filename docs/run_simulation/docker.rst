On Docker 
=========

Install Docker and docker-compose based on your `operating system <https://docs.docker.com/engine/install/>`_ . 

Steps to run the Colombia simulation in a docker environment 

1. Clone the `docker-setup` branch of `GCBM Colombia <https://github.com/moja-global/GCBM.Colombia/tree/docker-setup>`_  using the command

..  code-block:: bash

       git clone -b docker-setup https://github.com/moja-global/GCBM.Colombia


2. Navigate into directory `GCBM.Colombia`

..  code-block:: bash

       cd GCBM.Colombia


3. Use docker-compose to build the image

..  code-block:: bash

       docker-compose up -d


If an error with the following message appears :

`ERROR: Version in "./docker-compose.yml" is unsupported. You might be seeing this error because you're using the wrong Compose file version. Either specify a supported version (e.g "2.2" or "3.3") and place your service definitions under the services key, or omit the version key and place your service definitions at the root of the file to use version 1.
For more on the Compose file format versions, see https://docs.docker.com/compose/compose-file/`

Change the docker version in the file `./docker-compose.yml` to an appropriate version and run the command again.


4. Run the container using the command

..  code-block:: bash

       docker exec -it gcbm-colombia /bin/bash


5. Inside the running docker container, run

..  code-block:: bash

       cd /server/gcbm_project


6. Start the simulation using

..  code-block:: bash

       /opt/gcbm/moja.cli --config_file gcbm_config.cfg --config_provider provider_config.json


If there are existing images cached on your machine, you may need to docker pull ghcr.io/moja-global/rest_api_gcbm:master 
and build the container using `docker-compose -d --force-recreate`