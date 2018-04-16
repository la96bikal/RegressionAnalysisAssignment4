data case;
input y x1;
label  y = 'Mass muscle'
       x1 = 'Age';
datalines;
  106    43
  106    41
   97    47
  113    46
   96    45
  119    41
   92    47
  112    41
   92    48
  102    48
  107    42
  107    47
  102    43
  115    44
  101    42
   87    55
   91    57
   97    56
   82    59
   78    57
   95    54
   98    53
   94    52
   96    53
  100    54
   84    60
   70    59
  104    51
   76    59
   93    57
   73    68
   73    63
   76    60
   80    63
   84    63
   71    64
   64    66
   88    65
   79    60
   88    65
   73    65
   74    69
   76    61
   87    70
   70    68
   69    78
   54    78
   62    78
   78    72
   65    70
   64    73
   74    76
   87    78
   63    78
   82    71
   80    75
   52    77
   56    76
   70    72
   74    76
;
run;


proc sql;
  create table temp as
  select *, (x1-mean(x1)) as lx1,
  (x1-mean(x1))*(x1-mean(x1)) as lx2   
            from case;

proc reg data = temp;
model y = lx1 lx2 / clb;
plot y*lx1;
run;

proc sgplot data = case;
reg y = y x=x1 / degree=3;
run;
