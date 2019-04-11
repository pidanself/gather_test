#!/bin/bash


#there are totally 2398 pages in https://git.drupalcode.org/explore/projects
thost="https://git.drupalcode.org/explore/projects?page="

#if want to get all urls,replace '500' to '2398'

for i in `seq 1 500`
do   
rhost="$thost$i"
curl -o drupal.html  $rhost
#all urls will be stored in ./drupal.com
perl -ane 'while(m|<span class="project-name">([^<]*)</span>|g){print "https://git.drupalcode.org/project/$1\n"}' < drupal.html>> drupal.com

if i%10==0
then
    sleep 2
fi

done  


