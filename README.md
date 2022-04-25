# Chirpy Simple Starter [![Chirpy Badge][chirpy_badge]][chirpy] [![Licence Badge][mit_badge]][mit]



## Background

Chirpy Simple Starter is inspired by [Chirpy Starter][chirpy_starter] to provide a more simple template to setup [Chirpy Jekyll Theme][chirpy]. 

As said in chirpy-starter.

> When installing the Chirpy theme through RubyGems.org, Jekyll can only read files in the folders **_includes, _layout, _sass and assets**, as well as a small part of options of the _config.yml file from the theme's gem.

So in order to fully use all of the features provided by chirpy, the other theme related files and folders should also be there in the workspace. The original chirpy-starter put those files and folders in it's repository, when a new repository is created from chirpy-starter, those files and folders are already there.

Chirpy simple starter will also put all the theme related files and folders into workspace, but in a more tricky way. This chirpy-simple-starter only put those files to workspace at jekyll build phase, once the _site folder is generated, those theme related files will be removed. Finally, the repository will be tiny as below:

```
.
├── .github
├── .gitignore
├── .nojekyll
├── LICENSE
├── README.md
└── _config.yml
```

**.github** folder is responsible for github actions to deploy pages, it contains several scripts and one work flow yaml.

**.gitignore, LICENSE, README.md** are three base files for each github repository.

**.nojekyll** is an empty file, just used to let github stop deployling pages automatically.

**_config.yml** is the configuration file for jekyll theme.



## Installation

For local and github, the installation will be different.



### Local

0. Follow the instructions in the [Jekyll Docs][jekyll_docs] to complete the installation of ruby, gem, jeklly and bundler.

1. Create a repository from chirpy-simple-starter and clone/download it to local, or just clone/download the chirpy-simple-starter, then go into the folder in terminal.
2. Create _posts folder and add post files, update _config.yml then commit the changes.
3. Execute `.github/scripts/fetch_gemfile.sh` to fetch the latest Gemfile from jekyll-theme-chirpy.
4. Execute `bundle install` to install dependencies.
5. Execute `.github/scripts/copy_theme_files.sh` to copy other theme related files to workspace.
6. Execute `.github/scripts/deploy_pages.sh --dry-run`, then _site folder will be created, the folder contains all the static html files.
7. Deploy the _site folder to a web server.



### GitHub

On github, the environment setup and all of the script executions will be handle by github action, so just add post files and update _config.yml, then push to github.

1. Create a repository from chirpy-simple-starter and clone/download it to local, or just clone/download the chirpy-simple-starter, then go into the folder in terminal.
2. Create _posts folder and add post files, update _config.yml then commit the changes.
3. Push the local commit to github, the github repository name must be **<user_name>.github.io**, otherwise the pages won't be seen.
4. Configure **pages** under repository's **settings tab**, the source branch should be **gh-pages** and the folder should be **/root**.
5. Check the deployed pages on **https://<user_name>.github.io** after github action is done.



## Further Guide

Please refer to [Tutorial](https://chirpy.cotes.info/categories/tutorial/) for more information about Chirpy.



## License

Published under [MIT][mit] License.



[chirpy_badge]: https://img.shields.io/gem/v/jekyll-theme-chirpy?label=jekyll-theme-chirpy
[chirpy]: https://github.com/cotes2020/jekyll-theme-chirpy/
[mit_badge]: https://img.shields.io/github/license/chaiyan0216/chirpy-simple-starter?color=blue
[mit]: https://github.com/chaiyan0216/chirpy-simple-starter/blob/main/LICENSE
[chirpy_starter]: https://github.com/cotes2020/chirpy-starter
[jekyll_docs]: https://jekyllrb.com/docs/installation/
