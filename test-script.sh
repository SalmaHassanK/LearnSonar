# currentIntegrationBranch='master'
# currentBranch=`git branch --show-current`
# echo $currentIntegrationBranch
# echo $currentBranch
`git diff --name-only master feature/test-branching | tr '\n' ',' | sed 's/\(.*\),/\1 /'`
#fileDiff=`git diff --name-only $currentBranch $currentIntegrationBranch`
# filesInclusion="\n sonar.inclusions=$fileDiff"
# cd ..
# `echo $filesInclusion >> sonar-project.properties`