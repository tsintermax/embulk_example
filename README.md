# Embulk Example Project
This repository shows how to setup your simple embulk project.
## Prerequisites
- VSCode with "Dev Containers" Extension enabled
(or you can simply use our Dockerfile to build/run an image.)
- If you are ingesting to Bigquery or GCS, your GCP Credential key file located at `${HOME}/.config/gcloud` on your host machine. Your credential file can be created by  running `gcloud auth application-default login`.
    - Devcontainer extension will automatically mount your host machine credential dir on the devcontainer.

    - On production/CI environment, you need a different way to feed your credential.
   
## How to use
1. Locate source files  
    - In our example, we use */input directory to store source files.
2. Edit seed.yml to configure which files to be processed.  
    - If input type is "file",  you only need to set `path_prefix` to point to the right files.
3. Guess input schema  
    - Change `FOLDER` variable in the Makefile to decide which seed file to use.  
    - Run `make guess`  
    - Then config.yml would be generated with auto-detected schema, parsing settings, etc.   
4. Configure output in config.yml 
    - The config file scaffolded will simply output data to stdout
    - You can add filters or change output sections if needed.
5. Run embulk job
     - Run `make run`


## References
- [Configuration for built-in functionality](https://www.embulk.org/docs/built-in.html)
- [Available plugins](https://plugins.embulk.org/)