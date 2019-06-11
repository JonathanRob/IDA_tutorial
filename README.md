[![Travis Build Status](https://travis-ci.org/varemo/GSA_tutorial.svg?branch=master)](https://travis-ci.org/varemo/GSA_tutorial)
[![Docker Build Status](https://img.shields.io/docker/build/varemo/gsa_tutorial.svg)](https://hub.docker.com/r/varemo/gsa_tutorial/)

# Gene-set analysis tutorial

## User info:
GSA tutorial link:
https://varemo.github.io/GSA_tutorial/functional_annotation.html

This tutorial will take roughly 3-6h depending on previous experience.

(Suggested answers to the questions are available on request)

# Developer notes

### Files

    GSA_tutorial
    |
    |- data/                        # data file needed to carry out the tutorial
    |- slides/                      # slides used for presentations
    |
    |- .travis.yml                  # Travis CI settings (see info below)
    |- Dockerfile                   # Instructions to build a Docker image (see info below)
    |- data.zip                     # compressed data/ directory with data needed for the tutorial
    |- functional_annotation.Rmd    # Rmd file that is used to generate the html tutorial page (see info below)

### GitHub    

GitHub push --> 

* new Docker built automatically on Docker hub, available through docker pull
* Travis CI testing and webpage deployment

Commits are tagged at each course for easy access of the state of the repo at a given course (see Releases).  
Travis status badge added to README.md from Travis.

### Dockerfile

* Built from bioconductor/release_core2:R3.4.2_Bioc3.6 image that contains R and Rstudio. 
* Adds on: 
    - installation of required R packages
    - data/ directory
    
In Docker Hub: Create Auto-build from GitHub was selected to get the automated build to work.
This means that the image can be pulled (without building locally) by `docker pull varemo/GSA_tutorial`.
At Docker hub one can set build settings. Here a build was set on relevant git tags (i.e. courses).
So one can e.g. run `docker pull varemo/GSA_tutorial:NGS_course_GU_2017` to get the Docker image in the state it was at that course.

### Travis CI

Connect to GitHub repo at travis-ci.org. This sets up automatic testing at push to GitHub.
A GitHub token is added as an Environmental variable under settings at travis-ci.org.
The token is created in GitHub under user settings - Developer settings - Personal access tokens.
The Travis CI testing includes:

* test Docker build from Docker file
* test run code in Rmd file
* build html from Rmd file
* make a copy of html file where answers are displayed
* push back the 2 html files to gh-pages branch on GitHub
