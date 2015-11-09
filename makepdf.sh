#!/bin/bash

##############################
## PARAMETERS
##############################
name='report'
outputDir='myBuild'

#Set them if supplied
if [[ ! -z $1 ]]; then
    name=$1;
fi
if [[ ! -z $2 ]]; then
    outputDir=$2;
fi

##############################
## Set options
##############################

mkdir ${outputDir}

dateNow="date +%m-%d__%H:%M"
outputName="${name}_$(eval $dateNow)"

latexInBuildDir="-output-directory=${outputDir} -aux-directory=${outputDir}"
latexcommand="pdflatex -output-directory=${outputDir} -aux-directory=${outputDir} -interaction=nonstopmode"
mycmd="${latexcommand} $name"

##############################
## EXECUTE COMMANDS
##############################
$mycmd
cp library.bib ${outputDir}
(cd ${outputDir}; bibtex $name;);
(cd ${outputDir}; makeglossaries $name;);
$mycmd
$mycmd
(cd ${outputDir}; cp "${name}.pdf" "${outputName}.pdf");
