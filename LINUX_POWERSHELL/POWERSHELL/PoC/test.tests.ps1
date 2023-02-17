$n = 8
Describe "check number"{

    Context "check value of number"
    {
        It "number should be 9"
        {
            $n| should be 9
        }
    }
}