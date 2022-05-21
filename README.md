#

PR Build

sfdx sgd:source:delta --to dev --from $(git merge-base dev master) --output . --source force-app


sfdx sgd:source:delta --to "HEAD" --from "HEAD^" --output .     

sfdx force:source:deploy --manifest package/package.xml --checkonly --verbose      