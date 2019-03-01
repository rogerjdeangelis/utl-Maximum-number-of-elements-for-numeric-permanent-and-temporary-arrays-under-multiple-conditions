Maximum number of elements for numeric permanent and temporary arrays under multiple conditions                     
                                                                                                                    
 Here is my theory for SAS 9.4M2 64bit Win 7 array limits (unproven)                                                
                                                                                                                    
  Max number 8 byte floats in an single array                                                                       
  --------------------------------------------                                                                      
   268,435,355 = (2**31)/8-101 = max number of numeric elements variables)                                          
                                                                                                                    
                                                                                                                    
  Max number of dimensions (I doubt it)                                                                             
  -------------------------------------                                                                             
   27 is the maximum because 2**28(268,435,456) exceeds 268,435,355                                                 
                                                                                                                    
                                                                                                                    
  TEMPORARY ARRAYS (my attemp to support my theory)                                                                 
  -------------------------------------------------                                                                 
                                                                                                                    
    268,435,355 8 byte floats  (8*268,435,355 is about 2gb)                                                         
    2**28=268,435,456 Fails                                                                                         
                                                                                                                    
      data _null_;                                                                                                  
        array xs[268435355] _temporary_ (268435355*99);                                                             
          put xs[268435355]=;                                                                                       
      run;quit;                                                                                                     
                                                                                                                    
      XS[268435355]=99                                                                                              
                                                                                                                    
      NOTE: DATA statement used (Total process time):                                                               
            real time           2:34.72  Seconds                                                                    
                                                                                                                    
                                                                                                                    
  MAX DIMENSIONS PERMANENT or TEMPORARY ARRAYS (my attemp to support my theory)                                     
  -----------------------------------------------------------------------------                                     
                                                                                                                    
     27 is Maximum number of dimensions (27 works but 28 fails)                                                     
                                                                                                                    
     * non degenerate multi dimensional array;                                                                      
     data _null_;                                                                                                   
        array mat[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2] _temporary_ (134217728*7);                 
        put mat[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]=;                                            
     run;quit;                                                                                                      
                                                                                                                    
     MAT[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]=7                                                   
                                                                                                                    
                                                                                                                    
  MAXIMUM NUMBER OF NUMERIC ARRAY ELEMENTS THAT CAN BE WRITTEN TO A SAS TABLE                                       
  ---------------------------------------------------------------------------                                       
                                                                                                                    
     Althoug it may be possible to output 268,435,355 array variables, it is not practical?                         
                                                                                                                    
        data ONE1500000;                                                                                            
          array xs[*] x1-x1500000 (1500000*99);                                                                     
          put xs[1500000]=;                                                                                         
          output;                                                                                                   
          stop;                                                                                                     
        run;quit;                                                                                                   
                                                                                                                    
        x1500000 = 1500000                                                                                          
                                                                                                                    
                                                                                                                    
      Minutes:Secs (may be faster with large buffno and buffsize (nTerabyte max))                                   
                                                                                                                    
        1:36.34  1,500,000 Variables WORK.ONE1500000 has 1 observations                                             
                                                                                                                    
        2:52.70  1,600,000 Variables WORK.ONE1600000 has 1 observations                                             
        2:14.94  1,700,000 Variables WORK.ONE1700000 has 1 observations                                             
        5:06.85  1,800,000 Variables WORK.ONE1800000 has 1 observations                                             
        4:24.00  1,900,000 Variables WORK.ONE1900000 has 1 observations                                             
        4:37.83  2,000,000 Variables WORK.ONE2000000 has 1 observations                                             
                                                                                                                    
                                                                                                                    
        NOTE: DATA statement used (Total process time):                                                             
              real time           13.54 seconds                                                                     
                                                                                                                    
        x2000000 = 2000000  ( 2 millionith)                                                                         
                                                                                                                    
                                                                                                                    
      Much faster if you do not output the array variables (1,500,000)                                              
      -----------------------------------------------------------------                                             
                                                                                                                    
        data _null_;                                                                                                
          array xs[*] x1-x1500000 (1500000 * 99);                                                                   
          put xs[1500000]=;                                                                                         
        run;quit;                                                                                                   
                                                                                                                    
        X1500000=99                                                                                                 
        NOTE: DATA statement used (Total process time):                                                             
              real time           6.10 seconds                                                                      
                                                                                                                    
       Lighting fast with a temporary array (1,500,000)                                                             
       ------------------------------------------------                                                             
                                                                                                                    
        data _null_;                                                                                                
          array xs[1500000 ] _temporary_ (1500000 * 99);                                                            
          put xs[1500000]=;                                                                                         
        run;quit;                                                                                                   
                                                                                                                    
        XS[1500000]=99                                                                                              
        NOTE: DATA statement used (Total process time):                                                             
              real time           0.04 seconds                                                                      
                                                                                                                    
                                                                                                                    
