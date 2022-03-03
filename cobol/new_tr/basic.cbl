      * See https://www.codewars.com/kumite/61988aeb342ae10007d59487?sel=61988aeb342ae10007d59487

      * solution
       identification division.
       program-id. name.
      
       data division.
       local-storage section.
       ...
       linkage section.
       01 n           pic 9(8).
       01 result      pic 9(20).
      
       procedure division using n result.
      
          initialize result
      
          goback.
       end program NAME.
      
      * tests
       identification division.
       program-id. tests.
      
       data division.
       working-storage section.
       01 n           pic 9(8).
       01 result      pic 9(20).
       01 expected    pic 9(20).
       01 nDisp       pic z(19)9.
      
       procedure division.
           testsuite 'Fixed tests'.
           move 0 to n
           move 0 to expected
           perform doTest
      
           testsuite 'Random tests'.
           perform set-random-seed
           perform 0 times

               perform doTest
           end-perform

           end tests.
      
       doTest.
           move n to nDisp
           testcase 'Testing: n = ' function trim(nDisp).
       
           call 'NAME'
               using by content   n
                     by reference result
      
           expect result to be expected.
           .
      
       end program tests.
      
      

      * fixed size strings
       identification division.
       program-id. tests.
      
       data division.
       working-storage section.
       01 n           pic 9(5).
       01 result      pic x(21).
       01 expected    pic x(21).
       01 nDisp       pic z(19)9.
      
       procedure division.
           testsuite 'Fixed tests'.
           move '' to n
           move '' to expected
           perform doTest
      
           testsuite 'Random tests'.
           perform set-random-seed
           perform 0 times
               perform doTest
           end-perform
           end tests.
      
       doTest.
           move n to nDisp
           testcase 'Testing: n = ' function trim(nDisp).
       
           call 'NNAME'
               using by content   n
                     by reference result
      
           initialize assertion-message
           if result <> expected
              string 'Test failed' line-feed
                     'Expected "' function trim(expected) '"'
                      line-feed
                     'Actual   "' function trim(result trailing) '"'
               into assertion-message
               perform assert-false
            else
               perform assert-true
            end-if
           .
      
       end program tests.
      
