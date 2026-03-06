#!/bin/sh 
### General options 
### -- specify queue -- 
#BSUB -q man
### -- set the job Name -- 
#BSUB -J gen_wy[1-35]%10
### -- ask for number of cores (default: 1) -- 
#BSUB -n 1
### -- specify that the cores must be on the same host -- 
#BSUB -R "span[hosts=1]"
### -- specify that we need 4GB of memory per core/slot -- 
#BSUB -R "rusage[mem=4GB]"
### -- specify that we want the job to get killed if it exceeds 5 GB per core/slot -- 
#BSUB -M 5GB
### -- set walltime limit: hh:mm -- 
#BSUB -W 01:00 
### -- set the email address -- 
# please uncomment the following line and put in your e-mail address,
# if you want to receive e-mail notifications on a non-default address
#BSUB -u taigr@dtu.dk
### -- send notification at start -- 
###BSUB -B 
### -- send notification at completion -- 
#BSUB -N 
### -- Specify the output and error file. %J is the job-id -- 
### -- -o and -e mean append, -oo and -eo mean overwrite -- 
#BSUB -o Output_%J_%I.out 
#BSUB -e Output_%J_%I.err 

# here follow the commands you want to execute with input.in as the input file
module load python3/3.12.4
source weather_year_env/bin/activate
#List of weather years from 1982 to 2015
weather_years=(1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016)
python3 generate_weather_year_data.py -y ${weather_years[$LSB_JOBINDEX-1]}