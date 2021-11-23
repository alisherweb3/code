See https://www.codewars.com/kumite/61988aeb342ae10007d59487?sel=61988aeb342ae10007d59487

* solution
       identification division.
       program-id. name.

       data division.
       local-storage section.
       ...
       linkage section.
       01 n           PIC 9(8).
       01 result      PIC 9(20).
       procedure division using n result.
      
          compute result = ,
      
          goback.
       end program NAME.
      
      * tests
       identification division.
       program-id. tests.

       data division.
       working-storage section.
       01 n           PIC 9(8).
       01 result      PIC 9(20).
       01 expected    PIC 9(20).
       01 n-disp      PIC Z(19)9.
       procedure division.
           testsuite 'Fixed Tests'.
           move 0 to n
           move 0 to expected
           perform dotest
      
      
           testsuite 'Random Tests'.
           perform set-random-seed
           perform 0 times
               compute N = 100 * function random
               compute expected = 0
               perform dotest
           end-perform

           end tests.
      
       dotest.
           move n to n-disp
           testcase 'Testing: N = ' function trim(n-disp).
           initialize result
           call 'NAME'
               using by content n
               by reference result
           expect result to be expected.
           .
       end program tests.
      
      