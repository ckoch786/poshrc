function ColorizeCode {
    [CmdletBinding()]

    param(
        [parameter(ValueFromPipeline = $true)]
        [String]$Line
    )
    <#
      TODO add git info to this, who, when, created, tables used and args
      git summary info, add a transient mode.
      TODO add file detection and use appropriate keywords list
    #>

    begin{
        $keywords = @(
            "create", "procedure", "as", "begin", "set", "no", "count", "on",
            "select", "from", "where", "end", "go", "grant", "union", "inner", "join"
        )
    }
    process {

        $isKeyword = $false

        <#
          Example input for $Line
          CREATE PROCEDURE Employee_GetAllPermissionsForDate
        #>
        Log("`$Line: $Line")
        ForEach($word in $Line.Split(" ")) {
            Log("`$word: $word")
            $sanitizedWord = $word.ToLower().Trim().Replace(";", "")

            Log("`$sanitizedWord: $sanitizedWord")
            if($keywords.Contains($sanitizedWord)){
                Log("$word found!")
                $isKeyword = $true
                break
            }
        }

        Log("isKeyword? $isKeyword")
        if($isKeyword){
            Write-Host -Foreground "Blue" $Line
        }else{
            Write-Host $Line
        }
    }
    end{}
}

function Log{
    param(
        $m
    )

    $logInfo = $false
    if($logInfo) {
        write-output "INFO: $m"
    }
}
