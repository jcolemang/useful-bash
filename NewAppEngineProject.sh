#!/bin/bash

# The google app engine default template
APP_ENGINE_DEFAULT_PROJECT=/home/coleman/Classes/CSSE480/google_appengine/new_project_template

args=("$@")

if [[ ${#args[@]} == 1 ]];
then
   PROJECT_NAME=${args[0]}
else
    echo -e "Project name: \c"
    read PROJECT_NAME
fi

echo "Attempting to create project $PROJECT_NAME under $PWD"

if [[ -d $PROJECT_NAME ]];
then
   echo "Cannot create project, folder already exists."
   exit -1
fi

# make the project directory
mkdir $PROJECT_NAME

# copy the template project into the new directory
cp $APP_ENGINE_DEFAULT_PROJECT/main.py ./$PROJECT_NAME
cp $APP_ENGINE_DEFAULT_PROJECT/index.yaml ./$PROJECT_NAME
cp $APP_ENGINE_DEFAULT_PROJECT/app.yaml ./$PROJECT_NAME
cp $APP_ENGINE_DEFAULT_PROJECT/favicon.ico ./$PROJECT_NAME

# change the name of the project in app.yaml
sed -i "s/new-project-template/$PROJECT_NAME/g" ./$PROJECT_NAME/app.yaml

echo "Project created."
exit 0

