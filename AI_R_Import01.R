# This script explains the importing of data from Activity Info to R & R-Studio
#   This R-Script requires ActivityInfo R-libraries. For installation of the library
#   see https://github.com/bedatadriven/activityinfo-R

# R-environment
  rm(list = ls())  	    	# clear the R-environment
  cat("\014")			        # clear Console in R-studio
  options(scipen=999)		  # To avoid barcode in scientific notation in BRAC QIS database
# getOption("scipen")	  	# default value is 0 
library(activityinfo)  

# Set the working directory
# setwd("~/Google Drive/LASA/BRAC WASH DATA collection 2014/QIS analysis/DataAnalysis 2")

# Read AI online data directly into R data.frame
activityInfoLogin("KB.AI.testing@gmail.com","testing1234567890")
activityInfoRootUrl("https://www.activityinfo.org")
dataschema <- getDatabaseSchema(3870)  #loads the structures of the database form Activity Info
  
# Organize forms by name 
forms <- dataschema$activities
names(forms) <- sapply(forms, function(form) form$name)

# Fetch data as data.frame
testdata <- getSitesDataFrame(forms[["QIS basic analysis table format"]])


