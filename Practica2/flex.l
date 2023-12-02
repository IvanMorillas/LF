%{
  #include "./bison.tab.h"
%}

%%

"a"  { return a; }
"b"  { return b; }
"c"  { return c; }
"d"  { return d; }

%%
