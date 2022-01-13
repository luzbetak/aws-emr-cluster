#!/bin/bash
#--------------------------------------------------#
aws s3 cp data/alice29.txt  s3://luzbetak/input/
aws s3 cp wordcount1.py     s3://luzbetak/steps/
aws s3 cp wordcount2.py     s3://luzbetak/steps/

