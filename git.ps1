<#
Git
#>


function g1diffTODO {
    git diff | select-string "\/\/ TODO*" | Write-Host
}


# TODO create auto fill handler for g functions
# Using 1 and 2 to help with filtering g commands for now
function g1status { git status}

function g1log { git log }

function g1diff { git diff }

function g2pull { git pull }

function g1push { git push -u origin HEAD }

function g1AddAll { git add . }

function g2AddFiles {
  param (
    $files
  )
  
  git add $files
}

# TODO prompt for list and auto prefix the *
# Auto add the RAPD- prefix to commit message
# Add separate call or flag for default merge commit message
function g1CommitM {
  param (
    $message
  )
  
  git commit -m $message
}

function g2COFile {
   param(
      $file
   )
   $filePathWithBackslashes = $file.Replace("/", "\")

   git checkout $filePathWithBackslashes
}

function gitBranchFromLatest{
   param(
      $release_branch,
      $feature_branch_RAPD,
      $bugfix_branch_RAPD
   )
  
   git checkout $release_branch
   git fetch
   git pull

   if($feature_branch_RAPD) {
    git checkout -b feature/RAPD-$feature_branch_RAPD
   }

   if($bugfix_branch_RAPD) {
    git checkout -b bugfix/RAPD-$bugfix_branch_RAPD
   }
}

function gitMergeLatest {
   param(
      $release_branch,
      $feature_branch_RAPD,
      $bugfix_branch_RAPD
   )
  
   git checkout $release_branch
   git fetch
   git pull

   if($feature_branch_RAPD) {
    git checkout feature/RAPD-$feature_branch_RAPD
   }

   if($bugfix_branch_RAPD) {
    git checkout bugfix/RAPD-$bugfix_branch_RAPD
   }
   
  git merge $release_branch
}