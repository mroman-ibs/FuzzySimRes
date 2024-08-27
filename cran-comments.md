I have prepared the new version (0.4.3, previous version: 0.4.1) of my package. 

The main differences are listed below:
- Corrected errors in kolmim.c



I have prepared the new version (0.4.1, previous version: 0.4.0) of my package. 

The main differences are listed below:
- Corrected e-mail addresses in DESCRIPTION


I have prepared the new version (0.4.0, previous version: 0.3.0) of my package. 

The main differences are listed below:
- Added parameter ... to functions
- Now EpistemicEstimator can be used with the output provided by EpistemicBootstrap or AntitheticBootstrap
- Paremeter names for SimulateFuzzyNumber and SimulateSample are shortened
- Added new citation




I have prepared the new version (0.3.0, previous version: 0.2.1) of my package. 

The main differences are listed below:
- Improved output for AntitheticBootstrap and EpistemicBootstrap
- Added tests based on testthat package


I have prepared the new version (0.2.1, previous version: 0.2.0) of my package. 

The main differences are listed below:
- Functions for the estimators now calculate both the SE and MSE.


I have prepared the new version (0.2.0, previous version: 0.1.2) of my package. 

The main differences are listed below:
- Instead of only values, the functions that generate fuzzy numbers also return their "true origins"



I have prepared the new version (0.1.2, previous version: 0.1.1) of my package. 

The main differences are listed below:
- Spell-checking of all help files to correct some errors
- DOIs were checked. If the problem persists, please inform me about its place in a more detailed way.




I have prepared the new version (0.1.1, previous version: 0.1.0) of my package. 

The main differences are listed below:
- Added the missing field in DESCRIPTION file concerning Luis Carvalho:

  person("Luis", "Carvalho", email = "lexcarvalho at gmail.com", role = c("ctb","cph"),
    comment = c("Procedures from kolmim package in the kolmim.c file"))



## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## rhub::check_for_cran()

Build ID: 	FuzzySimRes_0.1.0.tar.gz-ce40f57938634ad0a48f06ca6b256090
Platform: 	Windows Server 2022, R-devel, 64 bit
Submitted: 	2 minutes 32.6 seconds ago
Build time: 	2 minutes 31 seconds

* checking CRAN incoming feasibility ... [11s] NOTE
Maintainer: 'Maciej Romaniuk <mroman@ibspan.waw.pl>'

New submission


Possibly misspelled words in DESCRIPTION:
  Coroianua (11:6)
  Epistemic (3:46)
  Grzegorzewski (12:101, 13:40)
  PLFNs (10:111)
  Romaniuk (12:119, 13:58)
  al (11:19)
  epistemic (12:63, 14:107, 15:56)
  et (11:16)
  
- Everything is OK with these words.

* checking for non-standard things in the check directory ... NOTE
Found the following files/directories:
  ''NULL''

* checking for detritus in the temp directory ... NOTE
Found the following files/directories:
  'lastMiKTeXException'
  
- Everything seems to be OK.

Build ID: 	FuzzySimRes_0.1.0.tar.gz-828e28fa9fc84b8584fc0c08992ce1a9
Platform: 	Fedora Linux, R-devel, clang, gfortran
Submitted: 	8 minutes 18.3 seconds ago
Build time: 	8 minutes 16.2 seconds

* checking CRAN incoming feasibility ... [6s/22s] NOTE
Maintainer: ‘Maciej Romaniuk <mroman@ibspan.waw.pl>’

New submission

Possibly misspelled words in DESCRIPTION:
  Coroianua (11:6)
  Grzegorzewski (12:101, 13:40)
  PLFNs (10:111)
  Romaniuk (12:119, 13:58)
  al (11:19)
  et (11:16)

* checking HTML version of manual ... NOTE
Skipping checking HTML validation: no command 'tidy' found

- Everything seems to be OK.


Build ID: 	FuzzySimRes_0.1.0.tar.gz-6cfcf9aadce343bda49697f822595e35
Platform: 	Ubuntu Linux 20.04.1 LTS, R-release, GCC
Submitted: 	9 minutes 59.8 seconds ago
Build time: 	9 minutes 57.2 seconds

The same notes as the above-mentioned.


Build ID: 	FuzzySimRes_0.1.0.tar.gz-e31f6264ba9242999afb14a608427ead
Platform: 	Debian Linux, R-devel, GCC ASAN/UBSAN
Submitted: 	33 minutes 47.8 seconds ago
Build time: 	33 minutes 42.9 seconds

The same notes as the above-mentioned.
  






