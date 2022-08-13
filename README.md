<div align="center">
    <a href="https://moja.global/"><img src="https://github.com/moja-global.png" width="18%" height="18%"></a>
    <h1>GCBM.Colombia</h1>
    <p> GCBM implementation in Colombia, initially with a focus on DOM modelling. This project is based on the Standalone Template for the GCBM, downloaded from https://carbon.nfis.org/cbm </p>    
</div>
<h3>Disclaimer : The calculations performed in this repository are not official and do not represent the Government of Colombia in any way.</h3>
<hr>
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
        <a href="#technology-stack">Technology Stack</a>
    </li>
    <li><a href="#installation-and-usage-instructions-on-windows">Installation and usage instructions on Windows</a></li>
    <li><a href='#custom-configuration-for-colombia'>Custom configuration for Colombia</li>
    <li><a href="#docker-based-setup">Docker-based setup</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#faq-and-other-questions">FAQ and Other Questions</a></li>
    <li><a href="#maintainers-reviewers-ambassadors-coaches">Maintainers Reviewers Ambassadors Coaches</a></li>
    <li><a href="#license">License</a></li>
  </ol>
  </br>
</details>

## Technology Stack

- [Python](https://www.python.org/)
- [R](https://www.r-project.org/)


## Installation and usage instructions on Windows

1. Clone the repository

2. Download the installation tools from "releases" (https://github.com/moja-global/GCBM.Colombia/releases/tag/install_tools) and unzip them into `Standalone_GCBM\tools` folder

3. Follow the installation instructions, located in `Standalone_GCBM\README.md`

4. Modify the `Standalone_GCBM\run_all.bat` file to activate or deactivate the custom parameter modifications (explained below), as default, all custom configurations are enabled

4. Execute `run_all.bat`

This codebase was tested using a Windows 10 system, the `Standalone_GCBM\README.md` file contains further explanation on the GCBM usage, and tutorials on the model can be found in the moja.global [Youtube Channel](https://www.youtube.com/channel/UCfQUrrNP1Xf-Fv4c8uHYXhQ)

## Custom configuration for Colombia

This implementation of the GCBM includes several parameter changes, that were included to adapt the model to Colombia´s local conditions

The `Standalone_GCBM\run_all.bat` file includes all the steps that were taken to adapt the model, as default, all parameter changes are enabled.

1. A custom Generic Tropical species in created (`input_database\add_species_vol_to_bio.py`) using a linear volume to biomass conversion factor and proportions of stem, bark, foliage and branges extracted from local literature. 

2. A custom set of root parameters (to convert from AGB to BGB) is applied (`input_database\modify_root_parameters.py`)

3. A set of decay parameters that was compiled from the scientific literature (`input_database\custom_parameters\decay parameters.py`) and is used to mofidy the default ones (`input_database\modify_decay_parameters.py`)

4. A sensitive turnover parameter (tree mortality) was modified (`input_database\modify_turnover_parameters.py`)

5. The disturbance regime of the spinup procedure was changed to "Clear-cut with slash-burn" every 15 years (`input_database\modify_spinup_parameters.py`) to refect the historic deforestation of tropical areas in Colombia, for agricultural purposes.

Steps 3, 4 and 5 can be enabled/disabled in the `run_all.bat` file to perform a sensitivity analysis

## Docker-based setup

1. Clone the `docker-setup` branch of [GCBM.Colombia](https://github.com/moja-global/GCBM.Colombia) using the command

      ```git clone -b docker-setup https://github.com/moja-global/GCBM.Colombia```

2. Navigate into `GCBM.Colombia` 

      ```cd GCBM.Colombia```

3. Use docker-compose to build the image

      ```docker-compose up -d```

4. Run the container using the command

      ``` docker exec -it gcbm-colombia /bin/bash ```

5. Inside the running docker container, run 

      ```cd /server/gcbm_project```

6. Start the simulation using 

    ```/opt/gcbm/moja.cli --config_file gcbm_config.cfg --config_provider provider_config.json``` 

If there are existing images cached on your machine you may need to `docker pull ghcr.io/moja-global/rest_api_gcbm:master` and build the container using `docker-compose -d --force-recreate`

## Contributing

moja global welcomes a wide range of contributions as explained in [Contributing document](https://github.com/moja-global/About-moja-global/blob/master/CONTRIBUTING.md) and in the [About moja-global Wiki](https://github.com/moja-global/.github/wiki).  

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

### Commit Convention

Before you create a Pull Request, please check whether your commits comply with
the commit conventions used in this repository.

When you create a commit we kindly ask you to follow the convention
`category(scope or module): message` in your commit message while using one of
the following categories:

- `feat / feature`: all changes that introduce completely new code or new
  features
- `fix`: changes that fix a bug (ideally you will additionally reference an
  issue if present)
- `refactor`: any code related change that is not a fix nor a feature
- `docs`: changing existing or creating new documentation (i.e. README, docs for
  usage of a lib or cli usage)
- `build`: all changes regarding the build of the software, changes to
  dependencies or the addition of new dependencies
- `test`: all changes regarding tests (adding new tests or changing existing
  ones)
- `ci`: all changes regarding the configuration of continuous integration (i.e.
  github actions, ci system)
- `chore`: all changes to the repository that do not fit into any of the above
  categories

If you are interested in the detailed specification you can visit
https://www.conventionalcommits.org/

### Branch-name Convention

We follow the convention `[type/scope]`. For example `fix/lint-error` or `docs/component-api`. `type` can be either `docs`, `fix`, `feat`, `build`, or any other conventional commit type. `scope` is just a short id that describes the scope of work.

### Development notes

For the developer environment setup, project structure, best practices etc. you can go through the Development Notes [here.](https://github.com/moja-global/FLINT-UI/blob/master/docs/DevelopmentGuide/DevelopmentNotes.rst).

### Read More

Find more comprehensive details about Moja Global Contributing Guidelines [here.](https://github.com/moja-global/About_moja_global/tree/master/Contributing#community-contributions)

## FAQ and Other Questions  

* You can find FAQs on the [Wiki](https://github.com/moja.global/.github/wiki).  
* If you have a question about the code, submit [user feedback](https://github.com/moja-global/About-moja-global/blob/master/Contributing/How-to-Provide-User-Feedback.md) in the relevant repository  
* If you have a general question about a project or repository or moja global, [join moja global](https://github.com/moja-global/About-moja-global/blob/master/Contributing/How-to-Join-moja-global.md) and 
    * [submit a discussion](https://help.github.com/en/articles/about-team-discussions) to the project, repository or moja global [team](https://github.com/orgs/moja-global/teams)
    * [submit a message](https://get.slack.help/hc/en-us/categories/200111606#send-messages) to the relevant channel on [moja global's Slack workspace](mojaglobal.slack.com). 
* If you have other questions, please write to info@moja.global   
## Maintainers Reviewers Ambassadors Coaches

The following people are Maintainers Reviewers Ambassadors or Coaches  
<table><tr><td align="center"><a href="http://moja.global"><img src="https://avatars1.githubusercontent.com/u/19564969?v=4" width="100px;" alt="moja global"/><br /><sub><b>moja global</b></sub></a><br /></td></tr></table>


**Maintainers** review and accept proposed changes  
**Reviewers** check proposed changes before they go to the Maintainers  
**Ambassadors** are available to provide training related to this repository  
**Coaches** are available to provide information to new contributors to this repository  

## License 

This project is released under the [Mozilla Public License Version 2.0](https://github.com/moja-global/FLINT-UI/blob/master/LICENSE).
