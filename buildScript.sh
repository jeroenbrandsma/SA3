name="report"
dateNow="date +%m-%d__%H:%M"
fullName="${name}_$(eval $dateNow)"
echo $fullName
curDir="${PWD##*/}"
inputDir='SA3/' 

latexcommand="pdflatex -interaction=nonstopmode"
mycmd="$latexcommand $name"

$mycmd
bibtex $name
makeglossaries $name
$mycmd
$mycmd

cp "${name}.pdf" "${fullName}.pdf"
