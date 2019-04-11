#!/bin/bash


#there are totally 2398 pages in https://git.drupalcode.org/explore/projects
thost="https://git.drupalcode.org/explore/projects?archived=true&sort=name_asc&page="

#if want to get all urls,replace '154' to '2398'

for i in `seq 1 154`
do   
rhost="$thost$i"
curl -o drupal.html  $rhost
#all urls will be stored in ./drupal.com
perl -ane 'while(m|<span class="project-name">([^<]*)</span>|g){print "https://git.drupalcode.org/project/$1\n"}' < drupal.html>> drupal.com
#sleep 2 seconds every 10 times in case it gets blocked
if [ `expr $i % 10` -eq 0 ]
then
    sleep 2
fi

done  

