#!/bin/bash


#there are totally 2398 pages in https://git.drupalcode.org/explore/projects
thost="https://git.drupalcode.org/explore/projects?page="

#if want to get all urls,change '10' to '2398'
for i in `seq 1 500`
do   
rhost="$thost$i"
curl -o drupal.html  $rhost
perl -ane 'while(m|<span class="project-name">([^<]*)</span>|g){print "https://git.drupalcode.org/project/$1\n"}' < drupal.html>> drupal.com
sleep 2
done  




