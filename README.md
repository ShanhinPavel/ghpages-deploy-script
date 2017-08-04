# ghpages-deploy-script
Test and demo repo for a script to deploy gh-pages on a successful CircleCI build.

You can see the site that this repository will automatically deploy to at
http://eldarlabs.github.io/ghpages-deploy-script/

Any changes committed to master will regenerate the gh-pages branch and thereby the website.

To get this to work I use a GitHub machine user as outlined in the circleci docs [here](https://circleci.com/docs/github-security-ssh-keys#machine-user-keys).

The script also seems to require you to init the git user and email. To hide this information, the script will grab the information from circleci environment variable. You will need to configure environment variables GH_NAME (GitHub Name) and GH_EMAIL (GitHub Email).

This repo was created as a testing ground to auto deploy the demo site of the [Cycle-UI](https://github.com/eldarlabs/cycle-ui) project.

License
=======

[The MIT License](https://raw.githubusercontent.com/eldarlabs/ghpages-deploy-script/master/LICENSE)

Copyright (c) 2016 [Eldar Labs](https://eldarlabs.com)
